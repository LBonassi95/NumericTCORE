import pytest
from unified_planning.model import problem
from unified_planning.shortcuts import *
from unified_planning.model import Problem
from unified_planning.io.pddl_reader import PDDLReader
from unified_planning.io.pddl_writer import PDDLWriter
from unified_planning.engines.compilers.grounder import Grounder
from unified_planning.model.fnode import FNode
from numeric_tcore.achievers_helper import *
from unified_planning.model.walkers import Simplifier
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

    regressed_expression = regression(expression, action)

    fluents = delta_achiever.extractor.get(expression) | delta_achiever.extractor.get(regressed_expression)

    new_vars_dict = delta_achiever._get_substitutions(fluents)

    new_expression = delta_achiever.substituter.substitute(expression, new_vars_dict)
    regressed_expression = delta_achiever.substituter.substitute(regressed_expression, new_vars_dict)

    delta = delta_achiever._get_delta(new_expression, regressed_expression)
    assert delta == expected


achievers_combinations = [
    (GE(Plus(x, y), 0), a3, True),
    (LE(Plus(x, y), 0), a3, False),
    (Equals(Plus(x, y), 0), a3, True),
    (Not(GE(Plus(x, y), 0)), a3, False),
    (GE(Plus(Times(-2, x), y), 0), a3, False),
    (Equals(Plus(x, y), 0), a1, False),
    (Not(Equals(Plus(x, y), 0)), a1, False),
    (Not(Equals(Plus(x, y), 0)), a3, True),
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


def test_achiever_computation_with_static_variables():
    reader = PDDLReader()
    domain_path = pkg_resources.resource_filename(__name__, 'pddl/zeno/zenonumeric.pddl')
    problem_path = pkg_resources.resource_filename(__name__, 'pddl/zeno/pfile1')
    problem = reader.parse_problem(domain_path, problem_path)
    grounding_result = Grounder().compile(
            problem, CompilationKind.GROUNDING
        )
    ground_problem = grounding_result.problem
    fly_slow_action = [act for act in ground_problem.actions if act.name == 'fly-slow_plane1_city0_city1'][0]
    fuel_fluent = [fluent for fluent in ground_problem.fluents if fluent.name == 'fuel'][0]
    plane1 = [obj for obj in ground_problem.all_objects if obj.name == 'plane1'][0]
    delta_achiever = AchieverHelper(DELTA, ground_problem.clone())
    formula = GT(fuel_fluent(plane1), 6000)
    assert delta_achiever.isAchiever(fly_slow_action, formula) == False
    for a in ground_problem.actions:
        delta_achiever.isAchiever(a, formula)


Boat = UserType("Boat")

b1 = Object("b1", Boat)
b2 = Object("b2", Boat)

a = Fluent("a", BoolType())
b = Fluent("b", BoolType())
c = Fluent("c", BoolType())

a1 = InstantaneousAction("a1")
a1.add_effect(a, True, Or(b, c))

a2 = InstantaneousAction("a2")
a2.add_effect(b, False, Or(a, c))

a3 = InstantaneousAction("a3")
a3.add_effect(a, True, Or(b, c))
a3.add_effect(b, False, Or(a, c))
a3.add_effect(c, True)


regression_achiever = AchieverHelper(REGRESSION)
delta_achiever = AchieverHelper(DELTA)


achievers_combinations = [
    (GE(Plus(x, y), 0), a1, False),
    (LE(Plus(x, y), 0), a3, False),
    (And(a, b), a1, True),
    (And(a, b), a2, False),
    (And(a, Not(b)), a2, True),
    (Not(c), a2, False),
    (Not(c), a3, False),
    (FluentExp(c), a3, True),
    (And(GE(x, 0), c), a3, True),
    (And(Not(c), Not(a), b), a3, False),
    (And(Not(c), Not(a), Not(b)), a3, True),
]
@pytest.mark.parametrize("expression,action,expected", achievers_combinations)
def test_is_achiever_bool_computation(expression, action, expected):
    result = delta_achiever.isAchiever(action, expression)
    assert result == expected