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
    _, _ = compiler.compile(problem)

def test_compilation_at_end():
    domain_path = pkg_resources.resource_filename(__name__, 'pddl/flags/domain.pddl')
    problem_path = pkg_resources.resource_filename(__name__, 'pddl/flags/p05.pddl')
    problem = parse_pddl3(domain_path, problem_path)
    compiler = NumericCompiler() 
    _, _ = compiler.compile(problem)


def test_compilation_tpp_delta_quantitative():
    domain_path = pkg_resources.resource_filename(__name__, 'pddl/tpp/domain.pddl')
    problem_path = pkg_resources.resource_filename(__name__, 'pddl/tpp/p02.pddl')
    problem = parse_pddl3(domain_path, problem_path)
    compiler = NumericCompiler() 
    compiler.achiever_strategy = DELTA
    _, _ = compiler.compile(problem)

def test_compilation_tpp_delta_quantitative_first_order():
    domain_path = pkg_resources.resource_filename(__name__, 'pddl/tpp/domain.pddl')
    problem_path = pkg_resources.resource_filename(__name__, 'pddl/tpp/p03.pddl')
    problem = parse_pddl3(domain_path, problem_path)
    compiler = NumericCompiler() 
    compiler.achiever_strategy = DELTA
    _, _ = compiler.compile(problem)

def test_compilation_tpp_delta_quantitative_first_order_logger():
    domain_path = pkg_resources.resource_filename(__name__, 'pddl/tpp/domain.pddl')
    problem_path = pkg_resources.resource_filename(__name__, 'pddl/tpp/p03.pddl')
    problem = parse_pddl3(domain_path, problem_path)
    compiler = NumericCompiler(achiever_strategy=NAIVE) 
    _, logger = compiler.compile(problem)
    assert logger.new_fluents == 4
    assert logger.new_effects == 300
    assert logger.new_effect_size == 1540
    assert logger.new_preconditions == 100
    assert logger.new_precondition_size == 760
    problem = parse_pddl3(domain_path, problem_path)
    compiler = NumericCompiler(achiever_strategy=DELTA)
    _, logger = compiler.compile(problem)
    assert logger.new_effects == 180
    assert logger.new_effect_size == 880
    assert logger.new_preconditions == 100
    assert logger.new_precondition_size == 760


if __name__ == '__main__':
    test_compilation_tpp_delta_quantitative()