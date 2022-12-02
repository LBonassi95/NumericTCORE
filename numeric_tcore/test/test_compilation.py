import pytest
from unified_planning.model import problem
from unified_planning.shortcuts import *
from unified_planning.io.pddl_reader import PDDLReader
from unified_planning.engines.compilers.grounder import Grounder
from unified_planning.model.fnode import FNode
from numeric_tcore.compilation import NumericCompiler


def test_compilation():
    reader = PDDLReader()
    problem = reader.parse_problem('/home/studenti/lbonassi/coding/NumericPlanning/NumericTCORE/notebooks/NumericPlanningDemo/domain.pddl', '/home/studenti/lbonassi/coding/NumericPlanning/NumericTCORE/notebooks/NumericPlanningDemo/problem.pddl')
    compiler = NumericCompiler() 
    tmp = CompilationKind.TRAJECTORY_CONSTRAINTS_REMOVING
    new_problem = compiler.compile(problem, CompilationKind.TRAJECTORY_CONSTRAINTS_REMOVING).problem