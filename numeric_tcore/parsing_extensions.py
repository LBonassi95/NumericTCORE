import unified_planning as up
from unified_planning.shortcuts import *
from unified_planning.model.expression import ConstantExpression
from unified_planning.model import ExpressionManager
from unified_planning.model.walkers import TypeChecker
from unified_planning.model.operators import OperatorKind
from unified_planning.io.pddl_reader import PDDLReader
from unified_planning.environment import get_environment

#WITHIN = "within"

class AtEnd:

    def __init__(self, formula) -> None:
        self.formula = formula

    def __repr__(self) -> str:
        return f"AtEnd({self.formula})"

class Within:

    def __init__(self, t, formula) -> None:
        self.t = t
        self.formula = formula

    def __repr__(self) -> str:
        return f"Within({self.t}, {self.formula})"
    
    
class HoldAfter:

    def __init__(self, t, formula) -> None:
        self.t = t
        self.formula = formula

    def __repr__(self) -> str:
        return f"HoldAfter({self.t}, {self.formula})"
    

class HoldDuring:

    def __init__(self, u1, u2, formula) -> None:
        self.u1 = u1
        self.u2 = u2
        self.formula = formula

    def __repr__(self) -> str:
        return f"HoldDuring({self.u1}, {self.u2}, {self.formula})"

class AlwaysWithin:

    def __init__(self, t, formula1, formula2) -> None:
        self.t = t
        self.formula1 = formula1
        self.formula2 = formula2

    def __repr__(self) -> str:
        return f"AlwaysWithin({self.t}, {self.formula1}, {self.formula2})"

    def __hash__(self) -> int:
        return hash((self.__class__, self.t, self.formula1, self.formula2))


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
    

def parse_pddl3(domain_path, problem_path):
    reader = PDDLReader()
    parser_extensions = ParserExtension()
    reader._trajectory_constraints["at-end"] = parser_extensions.parse_atend
    reader._trajectory_constraints["within"] = parser_extensions.parse_within
    reader._trajectory_constraints["hold-after"] = parser_extensions.parse_holdafter
    reader._trajectory_constraints["hold-during"] = parser_extensions.parse_holdduring
    reader._trajectory_constraints["always-within"] = parser_extensions.parse_alwayswithin
    problem = reader.parse_problem(domain_path, problem_path)
    quantitative_constrants = parser_extensions.constraints
    return PDDL3QuantitativeProblem(problem, quantitative_constrants)


class PDDL3QuantitativeProblem(AbstractProblem):

    def __init__(self, problem, quantitative_constraints) -> None:
        self.problem = problem
        self.quantitative_constraints = quantitative_constraints

    def kind(self) -> "up.model.problem_kind.ProblemKind":
        return super().kind()

    def has_name(self, name: str) -> bool:
        return super().has_name(name)
    
    def clone(self):
        return super().clone()
    
    def normalize_plan(self, plan: "up.plans.Plan") -> "up.plans.Plan":
        return super().normalize_plan(plan)
    
