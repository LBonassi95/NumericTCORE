import cProfile, pstats, io
from pstats import SortKey

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


def main():
    reader = PDDLReader()
    domain_path = '/home/studenti/lbonassi/coding/NumericPlanning/NumericTCORE/numeric_tcore/profiling/pddl/domain.pddl'
    problem_path = '/home/studenti/lbonassi/coding/NumericPlanning/NumericTCORE/numeric_tcore/profiling/pddl/pfile15.pddl'
    problem = reader.parse_problem(domain_path, problem_path)
    compiler = NumericCompiler(achiever_computation_strategy=REGRESSION) 
    compiler_delta = NumericCompiler(achiever_computation_strategy=DELTA) 

    # with cProfile.Profile() as pr:
    #     compiler.compile(problem, CompilationKind.TRAJECTORY_CONSTRAINTS_REMOVING)
    #     pr.print_stats(sort='cumtime')

    compiler_delta.compile(problem, CompilationKind.TRAJECTORY_CONSTRAINTS_REMOVING)

    

    # pr = cProfile.Profile()
    # pr.enable()
    # compiler_delta.compile(problem, CompilationKind.TRAJECTORY_CONSTRAINTS_REMOVING)
    # pr.disable()
    # s = io.StringIO()
    # sortby = SortKey.CUMULATIVE
    # ps = pstats.Stats(pr, stream=s).sort_stats(sortby)
    # ps.print_stats('.5')
    # with open('profile_delta.txt', 'w') as f:
    #     f.write(s.getvalue())


if __name__ == '__main__':
    main()
    