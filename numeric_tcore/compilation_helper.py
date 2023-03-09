from unified_planning.shortcuts import *
from unified_planning.model.walkers import ExpressionQuantifiersRemover



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