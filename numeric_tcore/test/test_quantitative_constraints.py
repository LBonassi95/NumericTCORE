import pytest
from unified_planning.model import problem
from unified_planning.shortcuts import *
from unified_planning.model import Problem
from unified_planning.io.pddl_reader import PDDLReader
from unified_planning.io.pddl_writer import PDDLWriter, ConverterToPDDLString
from unified_planning.engines.compilers.grounder import Grounder
from unified_planning.model.fnode import FNode
from unified_planning.model import ExpressionManager
from numeric_tcore.compilation import NumericCompiler
import pkg_resources
from numeric_tcore.achievers_helper import *
from numeric_tcore.parsing_extensions import *


def test_compilation():
    domain_path = pkg_resources.resource_filename(__name__, 'pddl/flags/domain.pddl')
    problem_path = pkg_resources.resource_filename(__name__, 'pddl/flags/p_quantitative.pddl')
    problem = parse_pddl3(domain_path, problem_path)
    compiler = NumericCompiler() 
    tmp = CompilationKind.TRAJECTORY_CONSTRAINTS_REMOVING
    compilation_result, _ = compiler.compile(problem, CompilationKind.TRAJECTORY_CONSTRAINTS_REMOVING)
    new_problem = compilation_result.problem

def test_compilation_at_end():
    domain_path = pkg_resources.resource_filename(__name__, 'pddl/flags/domain.pddl')
    problem_path = pkg_resources.resource_filename(__name__, 'pddl/flags/p05.pddl')
    problem = parse_pddl3(domain_path, problem_path)
    compiler = NumericCompiler() 
    tmp = CompilationKind.TRAJECTORY_CONSTRAINTS_REMOVING
    compilation_result, _ = compiler.compile(problem, CompilationKind.TRAJECTORY_CONSTRAINTS_REMOVING)
    new_problem = compilation_result.problem


def test_compilation_tpp_delta_quantitative():
    domain_path = pkg_resources.resource_filename(__name__, 'pddl/tpp/domain.pddl')
    problem_path = pkg_resources.resource_filename(__name__, 'pddl/tpp/p02.pddl')
    problem = parse_pddl3(domain_path, problem_path)
    compiler = NumericCompiler() 
    compiler.achiever_computation_strategy = DELTA
    tmp = CompilationKind.TRAJECTORY_CONSTRAINTS_REMOVING
    compilation_result, _ = compiler.compile(problem, CompilationKind.TRAJECTORY_CONSTRAINTS_REMOVING)
    new_problem = compilation_result.problem

def test_compilation_tpp_delta_quantitative_first_order():
    domain_path = pkg_resources.resource_filename(__name__, 'pddl/tpp/domain.pddl')
    problem_path = pkg_resources.resource_filename(__name__, 'pddl/tpp/p03.pddl')
    problem = parse_pddl3(domain_path, problem_path)
    compiler = NumericCompiler() 
    compiler.achiever_computation_strategy = DELTA
    tmp = CompilationKind.TRAJECTORY_CONSTRAINTS_REMOVING
    compilation_result, _ = compiler.compile(problem, CompilationKind.TRAJECTORY_CONSTRAINTS_REMOVING)
    new_problem = compilation_result.problem

def test_compilation_tpp_delta_quantitative_first_order_logger():
    domain_path = pkg_resources.resource_filename(__name__, 'pddl/tpp/domain.pddl')
    problem_path = pkg_resources.resource_filename(__name__, 'pddl/tpp/p03.pddl')
    problem = parse_pddl3(domain_path, problem_path)
    compiler = NumericCompiler() 
    compiler.achiever_computation_strategy = DELTA
    tmp = CompilationKind.TRAJECTORY_CONSTRAINTS_REMOVING
    compilation_result, logger = compiler.compile(problem, CompilationKind.TRAJECTORY_CONSTRAINTS_REMOVING)
    new_problem = compilation_result.problem


if __name__ == '__main__':
    test_compilation_tpp_delta_quantitative()