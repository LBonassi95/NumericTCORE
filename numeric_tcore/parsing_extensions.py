import unified_planning as up
from unified_planning.shortcuts import BoolExpression, TRUE, AbstractProblem, Problem, FNode, CompilationKind
from typing import List
from unified_planning.model.expression import ConstantExpression
from unified_planning.model.operators import OperatorKind
from unified_planning.io.pddl_reader import PDDLReader
from unified_planning.environment import get_environment
from unified_planning.engines.compilers.grounder import Grounder
from unified_planning.engines.results import CompilerResult
from unified_planning.shortcuts import And
from unified_planning.model.walkers import ExpressionQuantifiersRemover as QuantifiersRemover
from numeric_tcore.constraints import *


GROUNDING_ERROR_MSG = "Error during the grounding phase"


class ParserExtension:

    def __init__(self):
        self.constraints = []

    def parse_atend(self, phi: BoolExpression) -> "up.model.fnode.FNode":
        env = get_environment()
        em = env.expression_manager
        self.constraints.append(AtEnd(phi))
        return em.create_node(node_type=OperatorKind.SOMETIME, args=tuple([TRUE()]))

    def parse_within(self, time: ConstantExpression, phi: BoolExpression) -> "up.model.fnode.FNode":
        env = get_environment()
        em = env.expression_manager
        self.constraints.append(Within(time, phi))
        return em.create_node(node_type=OperatorKind.SOMETIME, args=tuple([TRUE()]))

    def parse_holdafter(self, time: ConstantExpression, phi: BoolExpression) -> "up.model.fnode.FNode":
        env = get_environment()
        em = env.expression_manager
        self.constraints.append(HoldAfter(time, phi))
        return em.create_node(node_type=OperatorKind.SOMETIME, args=tuple([TRUE()]))

    def parse_holdduring(self, u1: ConstantExpression, u2: ConstantExpression, phi: BoolExpression) -> "up.model.fnode.FNode":
        env = get_environment()
        em = env.expression_manager
        self.constraints.append(HoldDuring(u1, u2, phi))
        return em.create_node(node_type=OperatorKind.SOMETIME, args=tuple([TRUE()]))

    def parse_alwayswithin(self, t: ConstantExpression, phi: BoolExpression, psi: BoolExpression) -> "up.model.fnode.FNode":
        env = get_environment()
        em = env.expression_manager
        self.constraints.append(AlwaysWithin(t, phi, psi))
        return em.create_node(node_type=OperatorKind.SOMETIME, args=tuple([TRUE()]))
    

def parse_pddl3(domain_path, problem_path, lifted = False):
    reader = PDDLReader()
    parser_extensions = ParserExtension()
    reader._trajectory_constraints["at-end"] = parser_extensions.parse_atend
    reader._trajectory_constraints["within"] = parser_extensions.parse_within
    reader._trajectory_constraints["hold-after"] = parser_extensions.parse_holdafter
    reader._trajectory_constraints["hold-during"] = parser_extensions.parse_holdduring
    reader._trajectory_constraints["always-within"] = parser_extensions.parse_alwayswithin
    problem = reader.parse_problem(domain_path, problem_path)
    quantitative_constrants = parser_extensions.constraints
    if lifted:
        return PDDL3LiftedProblem(problem, quantitative_constrants)
    else:
        return PDDL3Problem(problem, quantitative_constrants)


def build_constraint_list(quantifier_remover: QuantifiersRemover, problem: Problem) -> List[FNode]:
        constraints = problem.trajectory_constraints
        C_temp = (And(constraints)).simplify()
        C_list = C_temp.args if C_temp.is_and() else [C_temp]
        C_to_return = (And(_remove_quantifier(quantifier_remover, C_list, problem))).simplify()
        constraints_list =  list(C_to_return.args) if C_to_return.is_and() else [C_to_return]

        if len(constraints_list) == 1 and (constraints_list[0] == True or constraints_list[0] == TRUE()):
            return []

        new_constraint_list = []
        for c in constraints_list:
            if c.is_always():
                new_constraint_list.append(Always(c.args[0]))
            elif c.is_sometime():
                new_constraint_list.append(Sometime(c.args[0]))
            elif c.is_at_most_once():
                new_constraint_list.append(AtMostOnce(c.args[0]))
            elif c.is_sometime_before():
                new_constraint_list.append(SometimeBefore(c.args[0], c.args[1]))
            elif c.is_sometime_after():
                new_constraint_list.append(SometimeAfter(c.args[0], c.args[1]))
            elif c.is_true():
                new_constraint_list.append(TRUE())
            else:
                raise Exception("Unsupported constraint: " + str(c))

        return new_constraint_list


def _remove_quantifier(quantifier_remover: QuantifiersRemover, C: list, problem: Problem):
        new_C = []
        for c in C:
            assert c.node_type is not OperatorKind.EXISTS
            new_C.append(
                quantifier_remover.remove_quantifiers(c, problem)
            )
        return new_C


class PDDL3LiftedProblem(AbstractProblem):

    """
    The Unified Planning framework supports some PDDL3 constraints.
    This class extends the support to include quantitative constraints and at-end constraints.
    """

    def __init__(self, problem: Problem, time_constraints: List[FNode]) -> None:
        self.time_constraints = time_constraints
        # Preprocess Other Constraints
        self.problem = problem.clone()
        self.env = problem.environment
        quantifier_remover = QuantifiersRemover(self.env)
        qualitative_constraints = build_constraint_list(quantifier_remover, self.problem)
        # create a list that contains trajectory_constraints
        # trajectory_constraints can contain quantifiers that need to be removed

        if len(qualitative_constraints) == 0 and len(time_constraints) == 0:
            raise Exception("No trajectory constraints to remove")
        
        self.qualitative_constraints = qualitative_constraints

    def kind(self) -> "up.model.problem_kind.ProblemKind":
        return super().kind()

    def has_name(self, name: str) -> bool:
        return super().has_name(name)
    
    def clone(self):
        return super().clone()
    
    def normalize_plan(self, plan: "up.plans.Plan") -> "up.plans.Plan":
        return super().normalize_plan(plan)


    def get_env(self):
        return self.env


class PDDL3Problem(AbstractProblem):

    """
    The Unified Planning framework supports some PDDL3 constraints.
    This class extends the support to include quantitative constraints and at-end constraints.
    """

    def __init__(self, problem: Problem, time_constraints: List[FNode]) -> None:
        self.time_constraints = time_constraints
        # Preprocess Other Constraints
        self.problem = problem.clone()
        self.env = problem.environment
        quantifier_remover = QuantifiersRemover(self.env)
        self.ground_problem = self.get_ground_problem()
        qualitative_constraints = build_constraint_list(quantifier_remover, self.ground_problem)
        # create a list that contains trajectory_constraints
        # trajectory_constraints can contain quantifiers that need to be removed

        if len(qualitative_constraints) == 0 and len(time_constraints) == 0:
            raise Exception("No trajectory constraints to remove")
        
        self.qualitative_constraints = qualitative_constraints

    def kind(self) -> "up.model.problem_kind.ProblemKind":
        return super().kind()

    def has_name(self, name: str) -> bool:
        return super().has_name(name)
    
    def clone(self):
        return super().clone()
    
    def normalize_plan(self, plan: "up.plans.Plan") -> "up.plans.Plan":
        return super().normalize_plan(plan)
    
    def get_ground_problem(self) -> Problem:
        grounding_result: CompilerResult = Grounder().compile(
            self.problem, CompilationKind.GROUNDING
        )
        ground_problem = grounding_result.problem.clone()
        if ground_problem is None:
            raise Exception(GROUNDING_ERROR_MSG)
        return ground_problem

    def get_env(self):
        return self.env
    
