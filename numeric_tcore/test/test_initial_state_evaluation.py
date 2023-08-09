import pytest
import pkg_resources
from unified_planning.io.pddl_reader import PDDLReader
from numeric_tcore.compilation import NumericCompiler, HOLD, SEEN_PSI, SEEN_PHI, SEPARATOR
from unified_planning.shortcuts import *
from unified_planning.model.walkers.state_evaluator import StateEvaluator
from unified_planning.exceptions import UPProblemDefinitionError
from unified_planning.model.state import State, UPState

agent = UserType('agent')
flag = UserType('flag')
a1 = Object('a1', agent)
f1 = Object('f1', flag)
ypos = Fluent('y-position', RealType(), a=agent)
planted = Fluent('planted', BoolType(), f=flag)


combinations = [(Always(GE(Plus(ypos(a1), 5), 0)), None, TRUE()),
                (Sometime(GE(Plus(ypos(a1), 5), 0)), HOLD, TRUE()),
                (SometimeAfter(Equals(ypos(a1), 0), planted(f1)), HOLD, FALSE()),
                (SometimeAfter(Equals(ypos(a1), 0), Not(planted(f1))), HOLD, TRUE()),
                (SometimeBefore(Equals(ypos(a1), 5), planted(f1)), SEEN_PSI, FALSE()),
                (AtMostOnce(Equals(ypos(a1), 0)), SEEN_PHI, TRUE())]

@pytest.mark.parametrize('constr, type, init_state_value', combinations)
def test_inital_state_evaluation_solvable(constr, type, init_state_value):
    domain_path = pkg_resources.resource_filename(__name__, 'pddl/flags/domain.pddl')
    problem_path = pkg_resources.resource_filename(__name__, 'pddl/flags/p01.pddl')
    reader = PDDLReader()
    problem = reader.parse_problem(domain_path, problem_path)
    compiler = NumericCompiler()
    state_evaluator = StateEvaluator(problem)
    initial_state = UPState(problem.initial_values)
    type_r, init_state_value_r = compiler._evaluate_constraint(state_evaluator, constr, initial_state)
    assert type_r == type
    assert init_state_value_r == init_state_value


combinations_unsat = [(Always(LE(Plus(ypos(a1), 5), 0)), None, FALSE()),
                      (SometimeBefore(Equals(ypos(a1), 0), planted(f1)), SEEN_PSI, FALSE())]

@pytest.mark.parametrize('constr, type, init_state_value', combinations_unsat)
def test_inital_state_evaluation_unsolvable(constr, type, init_state_value):
    domain_path = pkg_resources.resource_filename(__name__, 'pddl/flags/domain.pddl')
    problem_path = pkg_resources.resource_filename(__name__, 'pddl/flags/p01.pddl')
    reader = PDDLReader()
    problem = reader.parse_problem(domain_path, problem_path)
    compiler = NumericCompiler()
    state_evaluator = StateEvaluator(problem)
    initial_state = UPState(problem.initial_values)
    with pytest.raises(UPProblemDefinitionError):
        compiler._evaluate_constraint(state_evaluator, constr, initial_state)


def test_monitoring_atoms():
    domain_path = pkg_resources.resource_filename(__name__, 'pddl/flags/domain.pddl')
    problem_path = pkg_resources.resource_filename(__name__, 'pddl/flags/p01.pddl')
    reader = PDDLReader()
    problem = reader.parse_problem(domain_path, problem_path)
    compiler = NumericCompiler()
    state_evaluator = StateEvaluator(problem)
    constraints = [c for c, _, _ in combinations]
    initial_state = UPState(problem.initial_values)
    initial_state_prime, monitoring_atoms = compiler._get_monitoring_atoms(state_evaluator, constraints, initial_state)
    assert FluentExp(Fluent(f"{HOLD}{SEPARATOR}0", BoolType())) in initial_state_prime
    assert FluentExp(Fluent(f"{HOLD}{SEPARATOR}2", BoolType())) in initial_state_prime
    assert FluentExp(Fluent(f"{SEEN_PHI}{SEPARATOR}4", BoolType())) in initial_state_prime
    assert len(monitoring_atoms) == 5

if __name__ == "__main__":
    pytest.main()