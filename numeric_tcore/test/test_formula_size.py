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

from numeric_tcore.compilation_helper import *
from numeric_tcore.compilation import *

Boat = UserType("Boat")

b1 = Object("b1", Boat)
b2 = Object("b2", Boat)

x = Fluent("x", BoolType())
y = Fluent("y", BoolType())
z = Fluent("z", BoolType())

pos_x = Fluent("pos_x", RealType(), b = Boat)
pos_y = Fluent("pos-y", RealType(), b = Boat)
rel = Fluent("rel", RealType(), b1 = Boat, b2 = Boat)


combinations = [
    (FluentExp(x), 1),
    (And(x, y), 2),
    (Or(x, y), 2),
    (And(Or(x, y), Or(x, Not(z))), 4),
    (Plus(Minus(pos_x(b1), 15), Times(pos_y(b1), Plus(rel(b1, b2), 300))), 5),
    (Plus(Minus(pos_x(b1), 15), Div(pos_y(b1), Plus(rel(b1, b2), 300))), 5),
    (GE(pos_x(b1), pos_y(b2)), 2),
    (LE(pos_x(b1), pos_y(b2)), 2),
    (GT(pos_x(b1), pos_y(b2)), 2),
    (LT(pos_x(b1), pos_y(b2)), 2),
    (Equals(pos_x(b1), pos_y(b2)), 2),
    (Not(Equals(pos_x(b1), pos_y(b2))), 2),
    (LE(Plus(Minus(pos_x(b1), 15), Div(pos_y(b1), Plus(rel(b1, b2), 300))), Plus(Minus(pos_x(b1), 15), Div(pos_y(b1), Plus(rel(b1, b2), 300)))),10)

]

@pytest.mark.parametrize("formula,expected", combinations)
def test_get_formula_size(formula, expected):
    assert get_formula_size(formula) == expected


def test_compilation_block():
    # domain_path = pkg_resources.resource_filename(__name__, 'pddl/block-grouping/domain.pddl')
    # problem_path = pkg_resources.resource_filename(__name__, 'pddl/block-grouping/instance_5_10_2_1.pddl')
    domain_path = pkg_resources.resource_filename(__name__, 'pddl/tpp/domain.pddl')
    problem_path = pkg_resources.resource_filename(__name__, 'pddl/tpp/p03.pddl')
    problem = parse_pddl3(domain_path, problem_path)
    compiler = NumericCompiler(achiever_computation_strategy=NAIVE) 
    tmp = CompilationKind.TRAJECTORY_CONSTRAINTS_REMOVING
    compilation_result, logger = compiler.compile(problem, CompilationKind.TRAJECTORY_CONSTRAINTS_REMOVING)
    new_problem = compilation_result.problem

if __name__ == "__main__":
    test_compilation_block()