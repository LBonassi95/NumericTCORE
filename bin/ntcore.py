from unified_planning.model import problem
from unified_planning.shortcuts import *
from unified_planning.io.pddl_reader import PDDLReader
from unified_planning.io.pddl_writer import PDDLWriter
from unified_planning.engines.compilers.grounder import Grounder
from numeric_tcore.compilation import NumericCompiler
from unified_planning.model.fnode import FNode
from unified_planning.model.walkers.state_evaluator import StateEvaluator
import click
import os

@click.command()
@click.argument('domain')
@click.argument('problem')
@click.argument('output')
def main(domain, problem, output):
    reader = PDDLReader()

    problem = reader.parse_problem(domain, problem)
    compiler = NumericCompiler() 
    #tmp = CompilationKind.TRAJECTORY_CONSTRAINTS_REMOVING
    new_problem = compiler.compile(problem, CompilationKind.TRAJECTORY_CONSTRAINTS_REMOVING).problem

    writer = PDDLWriter(new_problem, needs_requirements=False)
    writer.write_domain(os.path.join(output, 'compiled_dom.pddl'))
    writer.write_problem(os.path.join(output, 'compiled_prob.pddl'))


if __name__ == '__main__':
    main()