# Copyright 2021 AIPlan4EU project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
"""This module defines the trajectory constraints remover class."""

import unified_planning as up
import unified_planning.engines as engines
from unified_planning.exceptions import UPProblemDefinitionError
from unified_planning.engines.mixins.compiler import CompilationKind, CompilerMixin
from unified_planning.engines.results import CompilerResult
from unified_planning.engines.compilers.grounder import Grounder
from unified_planning.model import InstantaneousAction, Action, FNode
from unified_planning.model.walkers import Substituter, ExpressionQuantifiersRemover
from unified_planning.model.walkers import FreeVarsExtractor
from unified_planning.model import Problem, ProblemKind
from unified_planning.model.operators import OperatorKind
from unified_planning.model.walkers.state_evaluator import StateEvaluator
from unified_planning.environment import Environment
from unified_planning.shortcuts import *
from functools import partial
from unified_planning.engines.compilers.utils import (
    lift_action_instance,
)
from typing import List, Dict, Tuple
from numeric_tcore.compilation_helper import *
from numeric_tcore.parsing_extensions import PDDL3Problem

NUM = "num"
CONSTRAINTS = "constraints"
HOLD = "hold"
GOAL = "goal"
SEEN_PHI = "seen-phi"
SEEN_PSI = "seen-psi"
PREVENT_PHI = "prevent-phi"
DEAD_END = "dead-end"
SEPARATOR = "-"


class NumericLiftedCompiler:
    """
    Main class of the NTCORE compiler. It removes trajectory constraints from a PDDL3 problem.
    """

    def __init__(self):
        self._monitoring_atom_dict: Dict[
            "up.model.fnode.FNode", "up.model.fnode.FNode"
        ] = {}


    def compile(self, pddl3_problem: PDDL3Problem) -> CompilerResult:
        """
        Transforms a Lifted PDDL3 problem into a new Lifted problem without trajectory constraints. 
        """
        env = pddl3_problem.get_env()
        assert isinstance(env, Environment)
        self._problem = pddl3_problem.problem.clone()

        C: List[Constraint] = pddl3_problem.qualitative_constraints
        dead_end_fluent = Fluent(DEAD_END, BoolType())
        # create a list that contains trajectory_constraints
        # trajectory_constraints can contain quantifiers that need to be removed
        if len(C) == 1 and C[0] == True:
            raise Exception("No trajectory constraints to remove")
        
        monitoring_atoms, monitoring_atom_dict = self._get_monitoring_atoms(C)

        self._monitoring_atom_dict = monitoring_atom_dict

        G_prime = And(*[self._monitoring_atom_dict[c] for c in get_landmark_constraints(C)])

        end_fluent = Fluent("end_fluent", BoolType())
        end_fluent_expr = FluentExp(end_fluent)
        
        E: List["up.model.effect.Effect"] = list()
        P = [Not(end_fluent_expr)]
        for c in C:
            assert isinstance(c, Constraint)

            if type(c) == Always:
                P.append(c.phi)

            elif type(c) == Sometime:
                assert len(self._monitoring_atom_dict[c]) == 1
                hold_atom = self._monitoring_atom_dict[c][0]
                E.append(Effect(condition=c.phi, fluent=hold_atom, value=TRUE()))

            elif type(c) == AtMostOnce:
                assert len(self._monitoring_atom_dict[c]) == 2
                seen_atom = self._monitoring_atom_dict[c][0]
                prevent_atom = self._monitoring_atom_dict[c][1]
                E.append(Effect(condition=c.phi, fluent=seen_atom, value=TRUE()))
                E.append(Effect(condition=And(Not(c.phi), seen_atom), fluent=prevent_atom, value=TRUE()))
                P.append(Not(And(c.phi, prevent_atom)))
            
            elif type(c) == SometimeBefore:
                assert len(self._monitoring_atom_dict[c]) == 1
                seen_atom = self._monitoring_atom_dict[c][0]
                E.append(Effect(condition=c.psi, fluent=seen_atom, value=TRUE()))
                P.append(Or(Not(c.phi), seen_atom))

            elif type(c) == SometimeAfter:
                assert len(self._monitoring_atom_dict[c]) == 1
                hold_atom = self._monitoring_atom_dict[c][0]
                E.append(Effect(condition=And(c.phi, Not(c.psi)), fluent=hold_atom, value=FALSE()))
                E.append(Effect(condition=c.psi, fluent=hold_atom, value=TRUE()))

        
        
        end_action = InstantaneousAction("end_action")
        for eff in E:
            end_action.effects.append(eff)
        for p in P:
            end_action.add_precondition(precondition=p)
        end_action.add_effect(condition=TRUE(), fluent=end_fluent, value=TRUE())

        self._problem.add_action(end_action)

        trace_back_map: Dict[Action, Tuple[Action, List[FNode]]] = {}
        for a in self._problem.actions:
            trace_back_map[a] = a
            assert isinstance(a, InstantaneousAction)
            for eff in E:
                a.effects.append(eff)
            for p in P:
                a.add_precondition(precondition=p)
            a.add_precondition(precondition=Not(end_fluent))

        for fluent in monitoring_atoms + [end_fluent]:
            self._problem.add_fluent(fluent)

        G_new = (And(self._problem.goals, G_prime, end_fluent_expr)).simplify()
        self._problem.clear_goals()
        self._problem.add_goal(G_new)
        self._problem.clear_trajectory_constraints()
        return self._problem

    def _get_monitoring_atoms(self, C: list[Constraint]):
        monitoring_atoms = []
        monitoring_atom_dict = {}
        monitoring_atoms_counter = 0
        for constr in C:
            
            fluents = None
            if type(constr) == Sometime:
                fluents = [Fluent(f"{HOLD}{SEPARATOR}{monitoring_atoms_counter}", BoolType())]
            elif type(constr) == AtMostOnce:
                fluents = [Fluent(f"{SEEN_PHI}{SEPARATOR}{monitoring_atoms_counter}", BoolType()), 
                           Fluent(f"{PREVENT_PHI}{SEPARATOR}{monitoring_atoms_counter}", BoolType())]
            elif type(constr) == SometimeAfter:
                fluents = [Fluent(f"{HOLD}{SEPARATOR}{monitoring_atoms_counter}", BoolType())]
            elif type(constr) == SometimeBefore:
                fluents = [Fluent(f"{SEEN_PSI}{SEPARATOR}{monitoring_atoms_counter}", BoolType())]

            if fluents is not None:
                monitoring_atoms += fluents
                monitoring_atoms_of_c = [FluentExp(fluent) for fluent in fluents]
                monitoring_atom_dict[constr] = monitoring_atoms_of_c
                monitoring_atoms_counter += len(fluents)
        return monitoring_atoms, monitoring_atom_dict