from unified_planning.shortcuts import *
from unified_planning.io.pddl_reader import PDDLReader
from unified_planning.io.pddl_writer import PDDLWriter
from numeric_tcore.compilation import NumericCompiler
from numeric_tcore.lifted_compilation import NumericLiftedCompiler

import click
import os
from numeric_tcore.achievers_helper import *
from numeric_tcore.parsing_extensions import *

@click.command()
@click.argument('domain')
@click.argument('problem')
@click.argument('output')
@click.option('--regression_mode', 'achiever_strategy', flag_value=REGRESSION, default=True)
@click.option('--delta_mode', 'achiever_strategy', flag_value=DELTA)
@click.option('--naive_mode', 'achiever_strategy', flag_value=NAIVE)
@click.option('--verbose', is_flag=True, default=False)
@click.option('--lifted', is_flag=True, default=False)
def main(domain, problem, output, achiever_strategy, verbose, lifted):
    problem = parse_pddl3(domain, problem, lifted=lifted)

    if lifted:
        compiler = NumericLiftedCompiler()
        new_problem = compiler.compile(problem)
    else:
        compiler = NumericCompiler(achiever_strategy=achiever_strategy) 
        #tmp = CompilationKind.TRAJECTORY_CONSTRAINTS_REMOVING
        new_problem, logger = compiler.compile(problem)

        if verbose:
            print(logger.get_log())

    writer = PDDLWriter(new_problem, needs_requirements=False)
    writer.write_domain(os.path.join(output, 'compiled_dom.pddl'))
    writer.write_problem(os.path.join(output, 'compiled_prob.pddl'))


if __name__ == '__main__':
    main()