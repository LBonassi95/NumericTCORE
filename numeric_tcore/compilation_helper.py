from unified_planning.shortcuts import *
from unified_planning.model.walkers import ExpressionQuantifiersRemover
from numeric_tcore.parsing_extensions import *

class Logger:
    def __init__(self):
        self.new_preconditions = 0
        self.new_effects = 0

    def get_log(self):
        msg = "New preconditions: {}\nNew effects: {}".format(self.new_preconditions, self.new_effects)
        return msg


def build_constraint_list(expression_quantifier_remover: ExpressionQuantifiersRemover, problem: Problem):
        constraints = problem.trajectory_constraints
        C_temp = (And(constraints)).simplify()
        C_list = C_temp.args if C_temp.is_and() else [C_temp]
        C_to_return = (And(_remove_quantifier(expression_quantifier_remover, C_list, problem))).simplify()
        return C_to_return.args if C_to_return.is_and() else [C_to_return]

def _remove_quantifier(expression_quantifier_remover: ExpressionQuantifiersRemover, C: list, problem: Problem):
        new_C = []
        for c in C:
            assert c.node_type is not OperatorKind.EXISTS
            new_C.append(
                expression_quantifier_remover.remove_quantifiers(c, problem)
            )
        return new_C

def get_landmark_constraints(C: List[FNode]):
    for constr in C:
        if constr.is_sometime() or constr.is_sometime_after():
            yield constr


def reformulate_quantitative_constraints(quantitative_constraints: List, time: Fluent):
    reformulated_constraints = []
    for constr in quantitative_constraints:
        if isinstance(constr, Within): 
            arg = And(constr.formula, LE(FluentExp(time), constr.t))
            reformulated_constraints.append(Sometime(arg))
        elif isinstance(constr, HoldAfter):
            arg1 = Equals(FluentExp(time), Plus(constr.t, 1))
            arg2 = constr.formula
            reformulated_constraints.append(SometimeAfter(arg1, arg2))
            arg = Or(Not(LE(FluentExp(time), constr.t)), constr.formula)
            reformulated_constraints.append(AtEnd(arg))
        elif isinstance(constr, HoldDuring):
            arg = Or(Not(And(GE(FluentExp(time), constr.u1), LT(FluentExp(time), constr.u2))), constr.formula)
            reformulated_constraints.append(Always(arg))
            arg = Or(Not(LE(FluentExp(time), constr.u1)), constr.formula)
            reformulated_constraints.append(AtEnd(arg))
             
    return reformulated_constraints