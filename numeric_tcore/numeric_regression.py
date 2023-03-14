from unified_planning.shortcuts import *
from unified_planning.model.fnode import FNode
import unified_planning as up



def gamma_substitution(literal: FNode, action: InstantaneousAction) -> FNode:
    gamma1 = gamma(literal, action)
    gamma2 = Not(gamma(Not(literal), action))
    conjunction = And([literal, gamma2])
    return Or([gamma1, conjunction])
    

def gamma(literal: FNode, action: InstantaneousAction):
    disjunction = []
    for eff in action.effects:
        assert isinstance(eff, Effect)
        cond = eff.condition
        if eff.value.is_false():
            eff = Not(eff.fluent)
        else:
            eff = eff.fluent
        if literal == eff:
            if cond.is_true():
                return TRUE()
            disjunction.append(cond)
    if not disjunction:
        return False
    return Or(disjunction)

def numeric_substitutuion(expression: FNode, action: InstantaneousAction):
    # TODO IMPROVE USING DICTIONARIES !!!!!
    assert expression.is_fluent_exp()
    for eff in action.effects:
        if eff.fluent == expression:
            if eff.kind == EffectKind.INCREASE:
                return Plus(expression, eff.value)
            elif eff.kind == EffectKind.DECREASE:
                return Minus(expression, eff.value)
            else:
                assert eff.kind == EffectKind.ASSIGN
                return eff.value
    return expression

def regression(expression: FNode, action: InstantaneousAction) -> FNode:
    if expression.is_false() or expression.is_true():
        return expression
    elif expression.is_fluent_exp():
        if expression.type.is_bool_type():
            return gamma_substitution(expression, action)
        else:
            # NUMERICAL VARIABLE
            return numeric_substitutuion(expression, action)
    elif expression.is_or():
        return Or([regression(disjunct, action) for disjunct in expression.args])
    elif expression.is_and():
        return And([regression(conjunct, action) for conjunct in expression.args])
    elif expression.is_not():
        return Not(regression(expression.arg(0), action))
    
    #NUMERIC EXPRESSIONS
    elif expression.is_equals():
        return Equals(regression(expression.args[0], action), regression(expression.args[1], action))
    elif expression.is_lt():
        return LT(regression(expression.args[0], action), regression(expression.args[1], action))
    elif expression.is_le():
        return LE(regression(expression.args[0], action), regression(expression.args[1], action))
    elif expression.is_plus():
        # return Plus(regression(expression.args[0], action), regression(expression.args[1], action))
        return Plus([regression(arg, action) for arg in expression.args])
    elif expression.is_minus():
        # For plus, we can have a list of arguments, but for minus, we can only have two arguments
        # This is how it is implemented in the Unified Planning library
        return Minus(regression(expression.args[0], action), regression(expression.args[1], action))
    elif expression.is_times():
        # return Times(regression(expression.args[0], action), regression(expression.args[1], action))
        return Times([regression(arg, action) for arg in expression.args])
    elif expression.is_div():
        # Like minus, we can only have two arguments for division
        return Div(regression(expression.args[0], action), regression(expression.args[1], action))
    elif expression.is_constant():
        return expression
    else:
        raise Exception("This compiler cannot handle this expression")