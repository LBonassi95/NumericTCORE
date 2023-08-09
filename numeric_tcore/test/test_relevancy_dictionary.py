import pytest
import pkg_resources
from unified_planning.io.pddl_reader import PDDLReader
from numeric_tcore.compilation import NumericCompiler, HOLD, SEEN_PSI, SEEN_PHI, SEPARATOR
from unified_planning.shortcuts import *
from unified_planning.model.walkers.state_evaluator import StateEvaluator
from unified_planning.exceptions import UPProblemDefinitionError

agent = UserType('agent')
flag = UserType('flag')
a1 = Object('a1', agent)
f1 = Object('f1', flag)
ypos = Fluent('y-position', RealType(), a=agent)
xpos = Fluent('x-position', RealType(), a=agent)
planted = Fluent('planted', BoolType(), f=flag)

constraints = [Always(GE(Plus(ypos(a1), 5), 0)),
              Sometime(GE(Plus(ypos(a1), 5), 0)),
              SometimeAfter(Equals(xpos(a1), 0), planted(f1)),
              SometimeAfter(Equals(ypos(a1), 0), Not(planted(f1))),
              SometimeBefore(Equals(xpos(a1), 5), planted(f1)),
              AtMostOnce(Equals(ypos(a1), 0))]

def test_relevancy_dict():
    domain_path = pkg_resources.resource_filename(__name__, 'pddl/flags/domain.pddl')
    problem_path = pkg_resources.resource_filename(__name__, 'pddl/flags/p01.pddl')
    reader = PDDLReader()
    problem = reader.parse_problem(domain_path, problem_path)
    compiler = NumericCompiler()
    relevancy_dict = compiler._build_var2constraints_dict(problem.environment, constraints)
    assert len(relevancy_dict[xpos(a1)]) == 2
    assert len(relevancy_dict[ypos(a1)]) == 4
    assert len(relevancy_dict[planted(f1)]) == 3
    assert Always(GE(Plus(ypos(a1), 5), 0)) in relevancy_dict[ypos(a1)]
    assert SometimeBefore(Equals(xpos(a1), 5), planted(f1)) in relevancy_dict[xpos(a1)]
    assert SometimeBefore(Equals(xpos(a1), 5), planted(f1)) in relevancy_dict[planted(f1)]

if __name__ == "__main__":
    pytest.main()