import pytest
from unified_planning.model import problem
from unified_planning.shortcuts import *
from unified_planning.model import Problem
from unified_planning.io.pddl_reader import PDDLReader
from unified_planning.io.pddl_writer import PDDLWriter
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


def test_compilation_sailing():
    reader = PDDLReader()
    domain_path = pkg_resources.resource_filename(__name__, 'pddl/sailing/domain.pddl')
    problem_path = pkg_resources.resource_filename(__name__, 'pddl/sailing/instance_3_10_1229.pddl')
    problem = reader.parse_problem(domain_path, problem_path)
    compiler = NumericCompiler() 
    tmp = CompilationKind.TRAJECTORY_CONSTRAINTS_REMOVING
    new_problem = compiler.compile(problem, CompilationKind.TRAJECTORY_CONSTRAINTS_REMOVING).problem

def test_compilation_sailing_2():
    reader = PDDLReader()
    domain_path = pkg_resources.resource_filename(__name__, 'pddl/sailing/domain.pddl')
    problem_path = pkg_resources.resource_filename(__name__, 'pddl/sailing/instance_3_8_1229.pddl')
    problem = reader.parse_problem(domain_path, problem_path)
    compiler = NumericCompiler() 
    tmp = CompilationKind.TRAJECTORY_CONSTRAINTS_REMOVING
    new_problem = compiler.compile(problem, CompilationKind.TRAJECTORY_CONSTRAINTS_REMOVING).problem


def test_compilation_zeno():
    reader = PDDLReader()
    domain_path = pkg_resources.resource_filename(__name__, 'pddl/zeno/zenonumeric.pddl')
    problem_path = pkg_resources.resource_filename(__name__, 'pddl/zeno/pfile1')
    problem = reader.parse_problem(domain_path, problem_path)
    compiler = NumericCompiler() 
    tmp = CompilationKind.TRAJECTORY_CONSTRAINTS_REMOVING
    new_problem = compiler.compile(problem, CompilationKind.TRAJECTORY_CONSTRAINTS_REMOVING).problem

def test_compilation_zeno2():
    reader = PDDLReader()
    domain_path = pkg_resources.resource_filename(__name__, 'pddl/zeno/zenonumeric.pddl')
    problem_path = pkg_resources.resource_filename(__name__, 'pddl/zeno/pfile2')
    problem = reader.parse_problem(domain_path, problem_path)
    compiler = NumericCompiler() 
    tmp = CompilationKind.TRAJECTORY_CONSTRAINTS_REMOVING
    with pytest.raises(Exception):
        new_problem = compiler.compile(problem, CompilationKind.TRAJECTORY_CONSTRAINTS_REMOVING).problem


def test_compilation_counters():
    reader = PDDLReader()
    domain_path = pkg_resources.resource_filename(__name__, 'pddl/counters/domain.pddl')
    problem_path = pkg_resources.resource_filename(__name__, 'pddl/counters/instance_12.pddl')
    problem = reader.parse_problem(domain_path, problem_path)
    compiler = NumericCompiler() 
    tmp = CompilationKind.TRAJECTORY_CONSTRAINTS_REMOVING
    new_problem = compiler.compile(problem, CompilationKind.TRAJECTORY_CONSTRAINTS_REMOVING).problem


def test_compilation_rovers():
    reader = PDDLReader()
    domain_path = pkg_resources.resource_filename(__name__, 'pddl/rovers/domain.pddl')
    problem_path = pkg_resources.resource_filename(__name__, 'pddl/rovers/pfile3.pddl')
    problem = reader.parse_problem(domain_path, problem_path)
    compiler = NumericCompiler() 
    tmp = CompilationKind.TRAJECTORY_CONSTRAINTS_REMOVING
    new_problem = compiler.compile(problem, CompilationKind.TRAJECTORY_CONSTRAINTS_REMOVING).problem