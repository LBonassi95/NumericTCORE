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

if __name__ == '__main__':
    test_compilation()