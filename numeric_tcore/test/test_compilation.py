import pytest
from unified_planning.model import problem
from unified_planning.shortcuts import *
from unified_planning.io.pddl_reader import PDDLReader
from unified_planning.engines.compilers.grounder import Grounder
from unified_planning.model.fnode import FNode
from numeric_tcore.compilation import NumericCompiler
import pkg_resources

def test_compilation():
    reader = PDDLReader()
    domain_path = pkg_resources.resource_filename(__name__, 'pddl/flags/domain.pddl')
    problem_path = pkg_resources.resource_filename(__name__, 'pddl/flags/p01.pddl')
    problem = reader.parse_problem(domain_path, problem_path)
    compiler = NumericCompiler() 
    tmp = CompilationKind.TRAJECTORY_CONSTRAINTS_REMOVING
    new_problem = compiler.compile(problem, CompilationKind.TRAJECTORY_CONSTRAINTS_REMOVING).problem