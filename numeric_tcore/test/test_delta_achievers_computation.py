import pytest
from unified_planning.model import problem
from unified_planning.shortcuts import *
from unified_planning.model import Problem
from unified_planning.io.pddl_reader import PDDLReader
from unified_planning.io.pddl_writer import PDDLWriter
from unified_planning.engines.compilers.grounder import Grounder
from unified_planning.model.fnode import FNode
from numeric_tcore.achievers_helper import *
import pkg_resources

from sympy.parsing.sympy_parser import parse_expr, standard_transformations

Boat = UserType("Boat")

b1 = Object("b1", Boat)
b2 = Object("b2", Boat)

x = Fluent("x", RealType())
y = Fluent("y", RealType())
z = Fluent("z", RealType())

pos_x = Fluent("pos_x", RealType(), b = Boat)
pos_y = Fluent("pos-y", RealType(), b = Boat)
rel = Fluent("rel", RealType(), b1 = Boat, b2 = Boat)

a1 = InstantaneousAction("a1")
a1.add_increase_effect(z, 1)

a2 = InstantaneousAction("a2")
a2.add_decrease_effect(x, 1)

a3 = InstantaneousAction("a3")
a3.add_increase_effect(x, 1)
a3.add_increase_effect(y, 2)
a3.add_decrease_effect(z, 3)

lineffect = InstantaneousAction("a4")
lineffect.add_effect(fluent=x, value=Plus(Times(x, 4), 5))

nonlineffect = InstantaneousAction("a5")
nonlineffect.add_effect(fluent=x, value=Plus(Times(x, y), 5))

selfinterference = InstantaneousAction("a6")
selfinterference.add_effect(fluent=x, value=Plus(x, 5))
selfinterference.add_effect(fluent=y, value=Plus(x, 5))

assign_with_minus = InstantaneousAction("a7")
assign_with_minus.add_effect(fluent=x, value=Minus(5, x))


mixed_effects = InstantaneousAction("a8")
mixed_effects.add_effect(fluent=x, value=Times(x, 5))
mixed_effects.add_effect(fluent=y, value=Minus(y, 5))


non_constant_non_achiever = InstantaneousAction("a9")
non_constant_non_achiever.add_effect(fluent=x, value=Plus(5, y))
non_constant_non_achiever.add_effect(fluent=y, value=Plus(x, 50))

n_cond1 = GE(x, 1)
n_cond2 = LE(y, 2)
n_cond3 = LE(z, 3)

regression_achiever = AchieverHelper(REGRESSION)
delta_achiever = AchieverHelper(DELTA)

combinations = [
    (a1, n_cond1, regression_achiever, False),
    (a1, n_cond2, regression_achiever, False),
    (a1, And(n_cond1, n_cond2), regression_achiever, False),
    (a1, Or(n_cond1, n_cond2), regression_achiever, False),
    (a1, And(n_cond1, n_cond3), regression_achiever, True),
    (a1, Or(n_cond1, Not(n_cond3)), regression_achiever, True),
    (a2, n_cond1, delta_achiever, False),
]

@pytest.mark.parametrize("action,formula,strategy,expected", combinations)
def test_achiever_computation(action,formula,strategy,expected):
    assert strategy.isAchiever(action, formula) == expected



def build_coefficient_dictionary(expr: FNode):
    assert expr.is_le() or expr.is_lt() or expr.is_not()

    if expr.is_not():
        expr = delta_achiever._get_negated_condition(expr)
    
    sympy_expr = parse_expr(str(expr), transformations=standard_transformations)
    coefficients = {}

    # If we have lhs <= rhs, we want to get 0 <= rhs - lhs

    normalized_expression = sympy_expr.rhs - sympy_expr.lhs

    for symbol in normalized_expression.free_symbols:
        coefficients[str(symbol)] = normalized_expression.coeff(symbol)

    return coefficients

expressions = [
    (GE(Times(-3, Plus(y, x)), Times(x, -7)), {'x': 4, 'y': -3}),
    (GE(Plus(Times(2.5, x), Plus(2, 3)), Times(3, y)), {'x': 2.5, 'y': -3}),
    (GT(0, Minus(Times(x, Plus(5, 5)), Times(14, z))), {'x': -10, 'z': 14}),
    (GT(pos_x(b1), 0), {'pos_x(b1)': 1}),
    (GT(Times(4, pos_x(b1)), Times(-2, pos_y(b2))), {'pos_x(b1)': 4, 'pos-y(b2)': 2}),
    (GT(Times(3, Minus(pos_x(b1), Times(5, pos_x(b2)))), 0), {'pos_x(b1)': 3, 'pos_x(b2)': -15}),
    (GT(Times(3, Minus(pos_x(b1), Times(5, pos_x(b1)))), 0), {'pos_x(b1)': -12}),
    (GT(Times(3, Minus(pos_x(b1), Times(5, rel(b1, b2)))), 0), {'pos_x(b1)': 3, 'rel(b1, b2)': -15}),
    (GT(Times(3, Minus(rel(b2, b1), Times(5, rel(b1, b2)))), 0), {'rel(b2, b1)': 3, 'rel(b1, b2)': -15}),
    (GT(Times(3, Minus(rel(b2, b1), Times(5, rel(b2, b1)))), 0), {'rel(b2, b1)': -12}),
    (LE(Times(4, pos_x(b1)), Times(-2, pos_y(b2))), {'pos_x(b1)': -4, 'pos-y(b2)': -2}),
    (Not(GT(Times(4, pos_x(b1)), Times(-2, pos_y(b2)))), {'pos_x(b1)': -4, 'pos-y(b2)': -2}),
    (Not(LE(Times(4, pos_x(b1)), Times(-2, pos_y(b2)))), {'pos_x(b1)': 4, 'pos-y(b2)': 2}),
]
@pytest.mark.parametrize("expression,expected", expressions)
def test_build_coefficient_dict(expression, expected):
    expression, var_dictionary = delta_achiever._preprocess_expression(expression)
    res = build_coefficient_dictionary(expression)
    map_back_res = {}
    for k, v in var_dictionary.items():
        map_back_res[str(k)] = res[str(v)]
    assert map_back_res == expected


delta_combinations = [

    (GE(Plus(x, y), 0), a3, 3),
    (GT(Plus(x, Plus(y, 5)), 0), a3, 3),
    (GT(Plus(Times(-3, x), Plus(y, 5)), 0), a3, -1),
    (GT(Plus(Times(-3, x), Times(y, 5)), 0), a3, 7),
    (Not(GE(Plus(x, y), 0)), a3, -3),
    (Not(GT(Plus(x, Plus(y, 5)), 0)), a3, -3),
    (Not(GT(Plus(Times(-3, x), Plus(y, 5)), 0)), a3, 1),
    (Not(GT(Plus(Times(-3, x), Times(y, 5)), 0)), a3, -7),
    (Not(GE(Plus(x, y), 0)), a3, -3)
]
@pytest.mark.parametrize("expression,action,expected", delta_combinations)
def test_delta_computation(expression, action, expected):
    if expression.is_not():
        expression = delta_achiever._get_negated_condition(expression)

    new_expression, new_vars_dict = delta_achiever._preprocess_expression(expression)

    regressed_expression = regression(expression, action)
    regressed_expression = delta_achiever.substituter.substitute(regressed_expression, new_vars_dict)

    delta = delta_achiever._get_delta(new_expression, regressed_expression)
    assert delta == expected


achievers_combinations = [
    (GE(Plus(x, y), 0), a3, True),
    (Not(GE(Plus(x, y), 0)), a3, False),
    (GE(Plus(Times(-2, x), y), 0), a3, False)
]
@pytest.mark.parametrize("expression,action,expected", achievers_combinations)
def test_is_achiever_computation(expression, action, expected):
    result = delta_achiever.isAchiever(action, expression)
    assert result == expected


achievers_combinations_nl = [
    (GE(Times(x, y), 0), a3, True),
]
@pytest.mark.parametrize("expression,action,expected", achievers_combinations_nl)
def test_is_achiever_computation_nonlinear_expressions(expression, action, expected):
    result = delta_achiever.isAchiever(action, expression)
    assert result == expected

achievers_combinations_ncli = [
    (GE(x, 0), lineffect, True),
    (GE(Times(x, y), 0), a3, True),
    (GE(x, 0), lineffect, True),
    (GE(x, 0), nonlineffect, True),
    (GE(x, 0), selfinterference, True),
    (GE(x, 0), mixed_effects, True),
    (GE(x, 0), assign_with_minus, True),
    (GE(y, 0), mixed_effects, False),
    (LT(Plus(x, y), 0), non_constant_non_achiever, False),

]
@pytest.mark.parametrize("expression,action,expected", achievers_combinations_ncli)
def test_is_achiever_computation_non_constant_linear_influence(expression, action, expected):
    result = delta_achiever.isAchiever(action, expression)
    assert result == expected


part1 = Not(GE(Plus(x, y), 0))
part2 = GE(Plus(Times(-2, x), y), 0)
part3 = GE(Plus(x, y), 0)

achievers_combinations_complex = [
    (And(part1, part2), a3, False),
    (Or(part1, part2), a3, False),
    (And(part1, part3), a3, True),
    (Or(part1, part3), a3, True),
]
@pytest.mark.parametrize("expression,action,expected", achievers_combinations_complex)
def test_is_achiever_computation_complex_formulas(expression, action, expected):
    result = delta_achiever.isAchiever(action, expression)
    assert result == expected


# combinations_ncli = [
#     (GE(x, 0), a3, True),
#     (GE(Times(x, y), 0), a3, False),
#     (GE(x, 0), lineffect, False),
#     (GE(x, 0), nonlineffect, False),
#     (GE(x, 0), selfinterference, True),
#     (GE(x, 0), selfinterference, False),
# ]
# @pytest.mark.parametrize("expression,action,expected", combinations_ncli)
# def test_cli(expression, action, expected):
#     result = delta_achiever._constant_numeric_influence(action, expression)
#     assert result == expected