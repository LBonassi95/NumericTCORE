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
def main(domain, problem, output):
    problem = parse_pddl3(domain, problem, lifted=True)

    compiler = NumericLiftedCompiler()
    new_problem = compiler.compile(problem)

    writer = PDDLWriter(new_problem, needs_requirements=False)
    writer.write_domain(os.path.join(output, 'compiled_dom.pddl'))
    writer.write_problem(os.path.join(output, 'compiled_prob.pddl'))


if __name__ == '__main__':
    main()