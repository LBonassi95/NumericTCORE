from unified_planning.shortcuts import *
from unified_planning.model.walkers import ExpressionQuantifiersRemover as QuantifiersRemover
from numeric_tcore.parsing_extensions import *

class Logger:
    def __init__(self):
        self.new_preconditions = 0
        self.new_effects = 0
        
        self.fluents = 0
        self.new_fluents = 0
        self.actions = 0

        self.original_precondition_size = 0
        self.original_effect_size = 0
        self.original_goal_size = 0
        
        self.new_precondition_size = 0
        self.new_effect_size = 0
        self.new_goal_size = 0

        self.qualitative_constraints = []
        self.time_constraints = []

    def get_log(self):
        always = 0
        sometime = 0
        at_most_once = 0
        sometime_before = 0
        sometime_after = 0
        hold_during = 0
        hold_after = 0
        within = 0
        always_within = 0
        for c in self.qualitative_constraints:
            assert isinstance(c, FNode)
            if c.is_always():
                always += 1
            elif c.is_sometime():
                sometime += 1
            elif c.is_at_most_once():
                at_most_once += 1
            elif c.is_sometime_before():
                sometime_before += 1
            elif c.is_sometime_after():
                sometime_after += 1
            else:
                raise Exception("Unknown constraint type {}".format(c))
        for c in self.time_constraints:
            if isinstance(c, HoldDuring):
                hold_during += 1
            elif isinstance(c, HoldAfter):
                hold_after += 1
            elif isinstance(c, Within):
                within += 1
            elif isinstance(c, AlwaysWithin):
                always_within += 1
            else:
                raise Exception("Unknown constraint type {}".format(c))

        msg = "New preconditions: {}\nNew effects: {}".format(self.new_preconditions, self.new_effects)
        msg += "\nAlways: {}".format(always)
        msg += "\nSometime: {}".format(sometime)
        msg += "\nAtMostOnce: {}".format(at_most_once)
        msg += "\nSometimeBefore: {}".format(sometime_before)
        msg += "\nSometimeAfter: {}".format(sometime_after)
        msg += "\nHoldDuring: {}".format(hold_during)
        msg += "\nHoldAfter: {}".format(hold_after)
        msg += "\nWithin: {}".format(within)
        msg += "\nAlwaysWithin: {}".format(always_within)
        msg += "\nFluents: {}".format(self.fluents)
        msg += "\nNew fluents: {}".format(self.new_fluents)
        msg += "\nActions: {}".format(self.actions)
        msg += "\nOriginal precondition size: {}".format(self.original_precondition_size)
        msg += "\nOriginal effect size: {}".format(self.original_effect_size)
        msg += "\nOriginal goal size: {}".format(self.original_goal_size)
        msg += "\nNew precondition size: {}".format(self.new_precondition_size)
        msg += "\nNew effect size: {}".format(self.new_effect_size)
        msg += "\nNew goal size: {}".format(self.new_goal_size)
        return msg


def build_constraint_list(quantifier_remover: QuantifiersRemover, problem: Problem) -> List[FNode]:
        constraints = problem.trajectory_constraints
        C_temp = (And(constraints)).simplify()
        C_list = C_temp.args if C_temp.is_and() else [C_temp]
        C_to_return = (And(_remove_quantifier(quantifier_remover, C_list, problem))).simplify()
        return list(C_to_return.args) if C_to_return.is_and() else [C_to_return]


def normalize_time_constraints(quantifier_remover: QuantifiersRemover, time_constraints: List, time_fluent: Fluent, problem: Problem):
    if len(time_constraints) > 0:
        time_constraints = ground_time_constraints(quantifier_remover, time_constraints, problem)
        always_within = [c for c in time_constraints if isinstance(c, AlwaysWithin)]
        qualitative_constraints, at_end_constraints = reformulate_time_constraints(time_constraints, time_fluent)
        # qualitative_constraints = [c for c in qualitative_constraints if not isinstance(c, AtEnd)]
        return qualitative_constraints, always_within, at_end_constraints
    else:
        return [], [], []
            

def ground_time_constraints(quantifier_remover: QuantifiersRemover, time_constraints: List, problem: Problem):
    ground_time_constraints = []
    for c in time_constraints:
        if isinstance(c, Within):
            ground_time_constraints.append(Within(c.t, quantifier_remover.remove_quantifiers(c.formula, problem)))
        elif isinstance(c, HoldAfter):
            ground_time_constraints.append(HoldAfter(c.t, quantifier_remover.remove_quantifiers(c.formula, problem)))
        elif isinstance(c, HoldDuring):
            ground_time_constraints.append(HoldDuring(c.u1, c.u2, quantifier_remover.remove_quantifiers(c.formula, problem)))
        elif isinstance(c, AlwaysWithin):
            ground_time_constraints.append(AlwaysWithin(c.t,
                                                                quantifier_remover.remove_quantifiers(c.formula1, problem), 
                                                                quantifier_remover.remove_quantifiers(c.formula2, problem)))
        elif isinstance(c, AtEnd):
            ground_time_constraints.append(AtEnd(quantifier_remover.remove_quantifiers(c.formula, problem)))
            
    return ground_time_constraints

def _remove_quantifier(quantifier_remover: QuantifiersRemover, C: list, problem: Problem):
        new_C = []
        for c in C:
            assert c.node_type is not OperatorKind.EXISTS
            new_C.append(
                quantifier_remover.remove_quantifiers(c, problem)
            )
        return new_C

def get_landmark_constraints(C: List[FNode]):
    for constr in C:
        if constr.is_sometime() or constr.is_sometime_after():
            yield constr


def reformulate_time_constraints(time_constraints: List, time: Fluent):
    qualitative_constraints = []
    at_end_constraints = []
    for constr in time_constraints:
        if isinstance(constr, Within): 
            arg = And(constr.formula, LE(FluentExp(time), constr.t))
            qualitative_constraints.append(Sometime(arg))
        elif isinstance(constr, HoldAfter):
            arg1 = Equals(FluentExp(time), Plus(constr.t, 1))
            arg2 = constr.formula
            qualitative_constraints.append(SometimeAfter(arg1, arg2))
            arg = Or(Not(LE(FluentExp(time), constr.t)), constr.formula)
            at_end_constraints.append(AtEnd(arg))
        elif isinstance(constr, HoldDuring):
            arg = Or(Not(And(GE(FluentExp(time), constr.u1), LT(FluentExp(time), constr.u2))), constr.formula)
            qualitative_constraints.append(Always(arg))
            arg = Or(Not(LE(FluentExp(time), constr.u1)), constr.formula)
            at_end_constraints.append(AtEnd(arg))
        elif isinstance(constr, AtEnd):
            at_end_constraints.append(AtEnd(constr.formula))
             
    return qualitative_constraints, at_end_constraints


def get_formula_size(formula: FNode, count_true_false = False):

    if formula.is_and() or formula.is_or():
        return sum([get_formula_size(arg) for arg in formula.args])
    elif formula.is_not():
        return get_formula_size(formula.arg(0))
    elif formula.is_fluent_exp():
        return 1
    elif formula.is_true() or formula.is_false():
        if count_true_false:
            return 1
        else:
            return 0
    elif formula.is_equals() or formula.is_le() or formula.is_lt():
        return get_formula_size(formula.arg(0)) + get_formula_size(formula.arg(1))
    elif formula.is_plus() or formula.is_minus() or formula.is_times() or formula.is_div():
        return get_formula_size(formula.arg(0)) + get_formula_size(formula.arg(1))
    elif formula.is_constant():
        return 1
    else:
        raise Exception("Unknown formula type {}".format(formula))