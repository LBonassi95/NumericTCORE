from unified_planning.shortcuts import *
from unified_planning.io.pddl_reader import PDDLReader
from unified_planning.io.pddl_writer import PDDLWriter
from numeric_tcore.compilation import NumericCompiler
import click
import os
from numeric_tcore.achievers_helper import *

@click.command()
@click.argument('domain')
@click.argument('problem')
@click.argument('output')
@click.option('--regression_mode', 'achiever_strategy', flag_value=REGRESSION, default=True)
@click.option('--delta_mode', 'achiever_strategy', flag_value=DELTA)
@click.option('--naive_mode', 'achiever_strategy', flag_value=NAIVE)
@click.option('--verbose', is_flag=True, default=False)
def main(domain, problem, output, achiever_strategy, verbose):
    reader = PDDLReader()
    problem = reader.parse_problem(domain, problem)

    compiler = NumericCompiler(achiever_computation_strategy=achiever_strategy) 
    #tmp = CompilationKind.TRAJECTORY_CONSTRAINTS_REMOVING
    compilation_result, logger = compiler.compile(problem, CompilationKind.TRAJECTORY_CONSTRAINTS_REMOVING)
    new_problem = compilation_result.problem

    if verbose:
        print(logger.get_log())

    writer = PDDLWriter(new_problem, needs_requirements=False)
    writer.write_domain(os.path.join(output, 'compiled_dom.pddl'))
    writer.write_problem(os.path.join(output, 'compiled_prob.pddl'))


if __name__ == '__main__':
    main()