import pytest
from unified_planning.model import problem
from unified_planning.shortcuts import *
from unified_planning.model import Problem
from unified_planning.io.pddl_reader import PDDLReader
from unified_planning.io.pddl_writer import PDDLWriter, ConverterToPDDLString
from unified_planning.engines.compilers.grounder import Grounder
from unified_planning.model.fnode import FNode
from numeric_tcore.compilation import NumericCompiler
import pkg_resources
from numeric_tcore.achievers_helper import *

def test_compilation():
    reader = PDDLReader()
    domain_path = pkg_resources.resource_filename(__name__, 'pddl/flags/domain.pddl')
    problem_path = pkg_resources.resource_filename(__name__, 'pddl/flags/p01.pddl')
    problem = reader.parse_problem(domain_path, problem_path)
    compiler = NumericCompiler() 
    tmp = CompilationKind.TRAJECTORY_CONSTRAINTS_REMOVING
    compilation_result, _ = compiler.compile(problem, CompilationKind.TRAJECTORY_CONSTRAINTS_REMOVING)
    new_problem = compilation_result.problem


def test_compilation_naive():
    reader = PDDLReader()
    domain_path = pkg_resources.resource_filename(__name__, 'pddl/flags/domain.pddl')
    problem_path = pkg_resources.resource_filename(__name__, 'pddl/flags/p01.pddl')
    problem = reader.parse_problem(domain_path, problem_path)
    compiler = NumericCompiler(achiever_computation_strategy=NAIVE) 
    tmp = CompilationKind.TRAJECTORY_CONSTRAINTS_REMOVING
    compilation_result, _ = compiler.compile(problem, CompilationKind.TRAJECTORY_CONSTRAINTS_REMOVING)
    new_problem = compilation_result.problem
    # for a in new_problem.actions:
    #     for p in a.preconditions:
    #         tmp = p.simplify()
    #     print()


def test_compilation_sailing():
    reader = PDDLReader()
    domain_path = pkg_resources.resource_filename(__name__, 'pddl/sailing/domain.pddl')
    problem_path = pkg_resources.resource_filename(__name__, 'pddl/sailing/instance_3_10_1229.pddl')
    problem = reader.parse_problem(domain_path, problem_path)
    compiler = NumericCompiler() 
    tmp = CompilationKind.TRAJECTORY_CONSTRAINTS_REMOVING
    compilation_result, _ = compiler.compile(problem, CompilationKind.TRAJECTORY_CONSTRAINTS_REMOVING)
    new_problem = compilation_result.problem

def test_compilation_sailing_2():
    reader = PDDLReader()
    domain_path = pkg_resources.resource_filename(__name__, 'pddl/sailing/domain.pddl')
    problem_path = pkg_resources.resource_filename(__name__, 'pddl/sailing/instance_3_8_1229.pddl')
    problem = reader.parse_problem(domain_path, problem_path)
    compiler = NumericCompiler() 
    tmp = CompilationKind.TRAJECTORY_CONSTRAINTS_REMOVING
    compilation_result, _ = compiler.compile(problem, CompilationKind.TRAJECTORY_CONSTRAINTS_REMOVING)
    new_problem = compilation_result.problem


def test_compilation_sailing_3():
    reader = PDDLReader()
    domain_path = pkg_resources.resource_filename(__name__, 'pddl/sailing/domain.pddl')
    problem_path = pkg_resources.resource_filename(__name__, 'pddl/sailing/instance_1_1_1229.pddl')
    problem = reader.parse_problem(domain_path, problem_path)
    compiler = NumericCompiler() 
    tmp = CompilationKind.TRAJECTORY_CONSTRAINTS_REMOVING
    compilation_result, _ = compiler.compile(problem, CompilationKind.TRAJECTORY_CONSTRAINTS_REMOVING)
    new_problem = compilation_result.problem

def test_compilation_sailing_logger():
    reader = PDDLReader()
    domain_path = pkg_resources.resource_filename(__name__, 'pddl/sailing/domain.pddl')
    problem_path = pkg_resources.resource_filename(__name__, 'pddl/sailing/instance_3_8_1229_fo.pddl')
    problem = reader.parse_problem(domain_path, problem_path)
    compiler = NumericCompiler() 
    tmp = CompilationKind.TRAJECTORY_CONSTRAINTS_REMOVING
    compilation_result, logger = compiler.compile(problem, CompilationKind.TRAJECTORY_CONSTRAINTS_REMOVING)
    new_problem = compilation_result.problem

def test_compilation_zeno_logger():
    reader = PDDLReader()
    domain_path = pkg_resources.resource_filename(__name__, 'pddl/zeno/zenonumeric.pddl')
    problem_path = pkg_resources.resource_filename(__name__, 'pddl/zeno/pfile3')
    problem = reader.parse_problem(domain_path, problem_path)
    compiler = NumericCompiler() 
    tmp = CompilationKind.TRAJECTORY_CONSTRAINTS_REMOVING
    compilation_result, logger = compiler.compile(problem, CompilationKind.TRAJECTORY_CONSTRAINTS_REMOVING)
    new_problem = compilation_result.problem

def test_compilation_farm():
    reader = PDDLReader()
    domain_path = pkg_resources.resource_filename(__name__, 'pddl/farm/domain.pddl')
    problem_path = pkg_resources.resource_filename(__name__, 'pddl/farm/instance_4_700_1229.pddl')
    problem = reader.parse_problem(domain_path, problem_path)
    # compiler = NumericCompiler(achiever_computation_strategy=DELTA) 
    # tmp = CompilationKind.TRAJECTORY_CONSTRAINTS_REMOVING
    # with pytest.raises(Exception):
    #     compilation_result, _ = compiler.compile(problem, CompilationKind.TRAJECTORY_CONSTRAINTS_REMOVING)
    #     new_problem = compilation_result.problem
    
    compiler = NumericCompiler(achiever_computation_strategy=REGRESSION) 
    tmp = CompilationKind.TRAJECTORY_CONSTRAINTS_REMOVING
    compilation_result, _ = compiler.compile(problem, CompilationKind.TRAJECTORY_CONSTRAINTS_REMOVING)
    new_problem = compilation_result.problem

    compiler = NumericCompiler(achiever_computation_strategy=NAIVE) 
    tmp = CompilationKind.TRAJECTORY_CONSTRAINTS_REMOVING
    compilation_result, _ = compiler.compile(problem, CompilationKind.TRAJECTORY_CONSTRAINTS_REMOVING)
    new_problem = compilation_result.problem

    
def test_compilation_zeno():
    reader = PDDLReader()
    domain_path = pkg_resources.resource_filename(__name__, 'pddl/zeno/zenonumeric.pddl')
    problem_path = pkg_resources.resource_filename(__name__, 'pddl/zeno/pfile1')
    problem = reader.parse_problem(domain_path, problem_path)
    compiler = NumericCompiler() 
    tmp = CompilationKind.TRAJECTORY_CONSTRAINTS_REMOVING
    compilation_result, _ = compiler.compile(problem, CompilationKind.TRAJECTORY_CONSTRAINTS_REMOVING)
    new_problem = compilation_result.problem

def test_compilation_zeno2():
    reader = PDDLReader()
    domain_path = pkg_resources.resource_filename(__name__, 'pddl/zeno/zenonumeric.pddl')
    problem_path = pkg_resources.resource_filename(__name__, 'pddl/zeno/pfile2')
    problem = reader.parse_problem(domain_path, problem_path)
    compiler = NumericCompiler() 
    tmp = CompilationKind.TRAJECTORY_CONSTRAINTS_REMOVING
    with pytest.raises(Exception):
        print()
        compilation_result, _ = compiler.compile(problem, CompilationKind.TRAJECTORY_CONSTRAINTS_REMOVING)
        #new_problem = compilation_result.problem


def test_compilation_counters():
    reader = PDDLReader()
    domain_path = pkg_resources.resource_filename(__name__, 'pddl/counters/domain.pddl')
    problem_path = pkg_resources.resource_filename(__name__, 'pddl/counters/instance_12.pddl')
    problem = reader.parse_problem(domain_path, problem_path)
    compiler = NumericCompiler() 
    tmp = CompilationKind.TRAJECTORY_CONSTRAINTS_REMOVING
    compilation_result, _ = compiler.compile(problem, CompilationKind.TRAJECTORY_CONSTRAINTS_REMOVING)
    new_problem = compilation_result.problem


def test_compilation_tpp():
    reader = PDDLReader()
    domain_path = pkg_resources.resource_filename(__name__, 'pddl/tpp/domain.pddl')
    problem_path = pkg_resources.resource_filename(__name__, 'pddl/tpp/p01.pddl')
    problem = reader.parse_problem(domain_path, problem_path)
    assert isinstance(problem, Problem)
    compiler = NumericCompiler() 
    tmp = CompilationKind.TRAJECTORY_CONSTRAINTS_REMOVING
    compilation_result, _ = compiler.compile(problem, CompilationKind.TRAJECTORY_CONSTRAINTS_REMOVING)
    new_problem = compilation_result.problem


def test_compilation_rovers():
    reader = PDDLReader()
    domain_path = pkg_resources.resource_filename(__name__, 'pddl/rovers/domain.pddl')
    problem_path = pkg_resources.resource_filename(__name__, 'pddl/rovers/pfile3.pddl')
    problem = reader.parse_problem(domain_path, problem_path)
    compiler = NumericCompiler() 
    tmp = CompilationKind.TRAJECTORY_CONSTRAINTS_REMOVING
    compilation_result, _ = compiler.compile(problem, CompilationKind.TRAJECTORY_CONSTRAINTS_REMOVING)
    new_problem = compilation_result.problem

if __name__ == "__main__":
    pytest.main()