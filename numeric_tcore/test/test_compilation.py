import pytest
from numeric_tcore.compilation import NumericCompiler
import pkg_resources
from numeric_tcore.achievers_helper import *
from numeric_tcore.parsing_extensions import *
from numeric_tcore.compilation_helper import Logger
from numeric_tcore.lifted_compilation import *


def get_time_update_effects(logger: Logger):
    return logger.actions


def test_lifted_compilation():
    domain_path = pkg_resources.resource_filename(__name__, 'pddl/flags/domain.pddl')
    problem_path = pkg_resources.resource_filename(__name__, 'pddl/flags/p01.pddl')
    problem = parse_pddl3(domain_path, problem_path, lifted = True)
    compiler = NumericLiftedCompiler() 
    res = compiler.compile(problem)


def test_lifted_compilation_sa():
    domain_path = pkg_resources.resource_filename(__name__, 'pddl/rovers-propositional/domain.pddl')
    problem_path = pkg_resources.resource_filename(__name__, 'pddl/rovers-propositional/p01.pddl')
    problem = parse_pddl3(domain_path, problem_path, lifted = True)
    compiler = NumericLiftedCompiler() 
    res = compiler.compile(problem)

    monitoring_atoms, _ = compiler._get_monitoring_atoms(problem.qualitative_constraints)
    assert len(monitoring_atoms) == 5

    hold_0 = Fluent("hold-0", typename=BoolType())()
    assert hold_0 in res.initial_values.keys()
    init_hold_0 = res.initial_values.get(hold_0)
    assert init_hold_0 == TRUE()
    for m in monitoring_atoms:
        matom = m()
        assert isinstance(matom, FNode)
        if "hold-0" not in str(matom):
            assert matom in res.initial_values.keys()
            assert res.initial_values.get(matom) == FALSE()
            assert not (res.initial_values.get(matom) == TRUE())
            
    end_fluent = Fluent("end_fluent", BoolType())
    end_fluent_expr = FluentExp(end_fluent)

    for a in res.actions:
        assert Not(end_fluent_expr) in a.preconditions

        if a.name == "end_action":
            assert Effect(condition=TRUE(), fluent=end_fluent_expr, value=TRUE()) in a.effects
        else:
            assert Effect(condition=TRUE(), fluent=end_fluent_expr, value=TRUE()) not in a.effects



def test_base_compilation_naive():
    domain_path = pkg_resources.resource_filename(__name__, 'pddl/flags/domain.pddl')
    problem_path = pkg_resources.resource_filename(__name__, 'pddl/flags/p01.pddl')
    problem = parse_pddl3(domain_path, problem_path)
    compiler = NumericCompiler(achiever_strategy=NAIVE) 
    _, logger = compiler.compile(problem)
    assert logger.new_fluents == 2
    assert logger.new_effects == 12
    assert logger.new_preconditions == 2
    problem = parse_pddl3(domain_path, problem_path)
    compiler = NumericCompiler(achiever_strategy=DELTA)
    _, logger = compiler.compile(problem)
    assert logger.new_effects == 7
    assert logger.new_preconditions == 1


def test_compilation_sailing():
    domain_path = pkg_resources.resource_filename(__name__, 'pddl/sailing/domain.pddl')
    problem_path = pkg_resources.resource_filename(__name__, 'pddl/sailing/instance_3_10_1229.pddl')
    problem = parse_pddl3(domain_path, problem_path)
    compiler = NumericCompiler(achiever_strategy=NAIVE)
    _, logger = compiler.compile(problem)
    assert logger.new_fluents == 10
    assert logger.new_effects == 510
    assert logger.new_preconditions == 459
    problem = parse_pddl3(domain_path, problem_path)
    compiler = NumericCompiler(achiever_strategy=DELTA)
    _, logger = compiler.compile(problem)
    assert logger.new_effects == 78
    assert logger.new_preconditions == 27


def test_compilation_sailing_2():
    domain_path = pkg_resources.resource_filename(__name__, 'pddl/sailing/domain.pddl')
    problem_path = pkg_resources.resource_filename(__name__, 'pddl/sailing/instance_3_8_1229.pddl')
    problem = parse_pddl3(domain_path, problem_path)
    compiler = NumericCompiler() 
    compiler = NumericCompiler(achiever_strategy=NAIVE)
    _, logger = compiler.compile(problem)
    assert logger.new_fluents == 5
    assert logger.new_effects == 225
    assert logger.new_preconditions == 0
    problem = parse_pddl3(domain_path, problem_path)
    compiler = NumericCompiler(achiever_strategy=DELTA)
    _, logger = compiler.compile(problem)
    assert logger.new_effects == 55
    assert logger.new_preconditions == 0



def test_compilation_sailing_3():
    domain_path = pkg_resources.resource_filename(__name__, 'pddl/sailing/domain.pddl')
    problem_path = pkg_resources.resource_filename(__name__, 'pddl/sailing/instance_1_1_1229.pddl')
    problem = parse_pddl3(domain_path, problem_path)
    compiler = NumericCompiler() 
    _, logger = compiler.compile(problem)
    assert logger.new_fluents == 2
    assert logger.new_effects == 16
    assert logger.new_preconditions == 7
    problem = parse_pddl3(domain_path, problem_path)
    compiler = NumericCompiler(achiever_strategy=DELTA)
    _, logger = compiler.compile(problem)
    assert logger.new_effects == 15
    assert logger.new_preconditions == 7


# def test_compilation_sailing_logger():
#     domain_path = pkg_resources.resource_filename(__name__, 'pddl/sailing/domain.pddl')
#     problem_path = pkg_resources.resource_filename(__name__, 'pddl/sailing/instance_3_8_1229_fo.pddl')
#     problem = parse_pddl3(domain_path, problem_path)
#     compiler = NumericCompiler() 
#     compilation_result, logger = compiler.compile(problem)


def test_compilation_zeno_logger():
    domain_path = pkg_resources.resource_filename(__name__, 'pddl/zeno/zenonumeric.pddl')
    problem_path = pkg_resources.resource_filename(__name__, 'pddl/zeno/pfile3')
    problem = parse_pddl3(domain_path, problem_path)
    compiler = NumericCompiler() 
    _, logger = compiler.compile(problem)
    assert logger.new_fluents == 3
    assert logger.new_effects == 258
    assert logger.new_preconditions == 258
    problem = parse_pddl3(domain_path, problem_path)
    compiler = NumericCompiler(achiever_strategy=DELTA)
    _, logger = compiler.compile(problem)
    assert logger.new_effects == 110
    assert logger.new_preconditions == 50


def test_compilation_farm():
    domain_path = pkg_resources.resource_filename(__name__, 'pddl/farm/domain.pddl')
    problem_path = pkg_resources.resource_filename(__name__, 'pddl/farm/instance_4_700_1229.pddl')
    problem = parse_pddl3(domain_path, problem_path)
    compiler = NumericCompiler(achiever_strategy=NAIVE) 
    _, _ = compiler.compile(problem)

    
def test_compilation_zeno():
    domain_path = pkg_resources.resource_filename(__name__, 'pddl/zeno/zenonumeric.pddl')
    problem_path = pkg_resources.resource_filename(__name__, 'pddl/zeno/pfile1')
    problem = parse_pddl3(domain_path, problem_path)
    compiler = NumericCompiler() 
    _, _ = compiler.compile(problem)
    

def test_compilation_zeno_no_constraints():
    domain_path = pkg_resources.resource_filename(__name__, 'pddl/zeno/zenonumeric.pddl')
    problem_path = pkg_resources.resource_filename(__name__, 'pddl/zeno/pfile2')
    problem = parse_pddl3(domain_path, problem_path)
    compiler = NumericCompiler() 
    # with pytest.raises(Exception):
    _, _ = compiler.compile(problem)


def test_compilation_counters():
    domain_path = pkg_resources.resource_filename(__name__, 'pddl/counters/domain.pddl')
    problem_path = pkg_resources.resource_filename(__name__, 'pddl/counters/instance_12.pddl')
    problem = parse_pddl3(domain_path, problem_path)
    compiler = NumericCompiler() 
    _, _ = compiler.compile(problem)
    


def test_compilation_tpp():
    domain_path = pkg_resources.resource_filename(__name__, 'pddl/tpp/domain.pddl')
    problem_path = pkg_resources.resource_filename(__name__, 'pddl/tpp/p01.pddl')
    problem = parse_pddl3(domain_path, problem_path)
    assert isinstance(problem, PDDL3Problem)
    compiler = NumericCompiler() 
    _, _ = compiler.compile(problem)
    


def test_compilation_rovers():
    with pytest.raises(Exception):
        domain_path = pkg_resources.resource_filename(__name__, 'pddl/rovers/domain.pddl')
        problem_path = pkg_resources.resource_filename(__name__, 'pddl/rovers/pfile3.pddl')
        problem = parse_pddl3(domain_path, problem_path)
        compiler = NumericCompiler()
        # _, _ = compiler.compile(problem)
        # 

if __name__ == "__main__":
    pytest.main()