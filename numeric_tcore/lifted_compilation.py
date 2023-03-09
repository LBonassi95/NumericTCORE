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
from numeric_tcore.numeric_regression import regression
from numeric_tcore.compilation_helper import *

NUM = "num"
CONSTRAINTS = "constraints"
HOLD = "hold"
GOAL = "goal"
SEEN_PHI = "seen-phi"
SEEN_PSI = "seen-psi"
PREVENT_PHI = "prevent-phi"
DEAD_END = "dead-end"
SEPARATOR = "-"


class NumericLiftedCompiler(engines.engine.Engine, CompilerMixin):
    """
    TrajectoryConstraintsRemover class: the `TrajectoryConstraintsRemover` takes a :class:`~unified_planning.model.Problem`
    that contains 'trajectory_constraints' and returns a new grounded 'Problem' without those constraints.

    The compiler, for each trajectory_constraints manages 'Actions' (precondition and effects) and 'Goals'.

    This `Compiler` supports only the the `TRAJECTORY_CONSTRAINTS_REMOVING` :class:`~unified_planning.engines.CompilationKind`.
    """

    def __init__(self):
        engines.Engine.__init__(self)
        CompilerMixin.__init__(self, CompilationKind.TRAJECTORY_CONSTRAINTS_REMOVING)
        self._monitoring_atom_dict: Dict[
            "up.model.fnode.FNode", "up.model.fnode.FNode"
        ] = {}

    @property
    def name(self):
        return "TrajectoryConstraintsRemover"

    @staticmethod
    def supports(problem_kind):
        #return problem_kind <= NumericCompiler.supported_kind()
        return True

    @staticmethod
    def supports_compilation(compilation_kind: CompilationKind) -> bool:
        return compilation_kind == CompilationKind.TRAJECTORY_CONSTRAINTS_REMOVING

    @staticmethod
    def supported_kind() -> ProblemKind:
        supported_kind = ProblemKind()
        supported_kind.set_problem_class("ACTION_BASED")
        supported_kind.set_typing("FLAT_TYPING")
        supported_kind.set_typing("HIERARCHICAL_TYPING")
        supported_kind.set_numbers("CONTINUOUS_NUMBERS")
        supported_kind.set_numbers("DISCRETE_NUMBERS")
        supported_kind.set_fluents_type("NUMERIC_FLUENTS")
        supported_kind.set_fluents_type("OBJECT_FLUENTS")
        supported_kind.set_conditions_kind("NEGATIVE_CONDITIONS")
        supported_kind.set_conditions_kind("DISJUNCTIVE_CONDITIONS")
        supported_kind.set_conditions_kind("EQUALITY")
        supported_kind.set_conditions_kind("EXISTENTIAL_CONDITIONS")
        supported_kind.set_conditions_kind("UNIVERSAL_CONDITIONS")
        supported_kind.set_effects_kind("CONDITIONAL_EFFECTS")
        supported_kind.set_effects_kind("INCREASE_EFFECTS")
        supported_kind.set_effects_kind("DECREASE_EFFECTS")
        supported_kind.set_time("CONTINUOUS_TIME")
        supported_kind.set_time("DISCRETE_TIME")
        supported_kind.set_time("INTERMEDIATE_CONDITIONS_AND_EFFECTS")
        supported_kind.set_time("TIMED_EFFECT")
        supported_kind.set_time("TIMED_GOALS")
        supported_kind.set_time("DURATION_INEQUALITIES")
        supported_kind.set_simulated_entities("SIMULATED_EFFECTS")
        supported_kind.set_constraints_kind("TRAJECTORY_CONSTRAINTS")
        return supported_kind

    # def _compile(
    #     self,
    #     problem: "up.model.AbstractProblem",
    #     compilation_kind: "up.engines.CompilationKind",
    # ) -> CompilerResult:
    #     """
    #     Takes an instance of a :class:`~unified_planning.model.Problem` and the `TRAJECTORY_CONSTRAINTS_REMOVING` :class:`~unified_planning.engines.CompilationKind`
    #     and returns a `CompilerResult` where the problem whitout trajectory_constraints.

    #     :param problem: The instance of the `Problem` that contains the trajecotry constraints.
    #     :param compilation_kind: The `CompilationKind` that must be applied on the given problem;
    #         only `TRAJECTORY_CONSTRAINTS_REMOVING` is supported by this compiler
    #     :return: The resulting `CompilerResult` data structure.
    #     """
    #     assert isinstance(problem, Problem)
    #     env = problem.env
    #     assert isinstance(env, Environment)
    #     expression_quantifier_remover = ExpressionQuantifiersRemover(problem.env)
    #     self._problem = problem.clone()
    #     self._problem.name = f"{self.name}_{problem.name}"

    #     C = build_constraint_list(expression_quantifier_remover, self._problem)
    #     dead_end_fluent = Fluent(DEAD_END, BoolType())
    #     # create a list that contains trajectory_constraints
    #     # trajectory_constraints can contain quantifiers that need to be removed
    #     if len(C) == 1 and C[0] == True:
    #         raise Exception("No trajectory constraints to remove")
        
    #     monitoring_atoms, monitoring_atom_dict = self._get_monitoring_atoms(C)

    #     self._monitoring_atom_dict = monitoring_atom_dict

    #     G_prime = And(*[self._monitoring_atom_dict[c] for c in get_landmark_constraints(C)])
        
    #     E: List["up.model.effect.Effect"] = list()
    #     for c in C:
    #         phi = c.args[0]

    #         if c.is_always():
    #             E.append(Effect(condition=Not(phi), fluent=FluentExp(dead_end_fluent), value=TRUE()))

    #         elif c.is_sometime():
    #             assert len(self._monitoring_atom_dict[c]) == 1
    #             hold_atom = self._monitoring_atom_dict[c][0]
    #             E.append(Effect(condition=phi, fluent=hold_atom, value=TRUE()))

    #         elif c.is_at_most_once():
    #             assert len(self._monitoring_atom_dict[c]) == 2
    #             seen_atom = self._monitoring_atom_dict[c][0]
    #             prevent_atom = self._monitoring_atom_dict[c][1]
    #             E.append(Effect(condition=phi, fluent=seen_atom, value=TRUE()))
    #             E.append(Effect(condition=And(Not(phi), seen_atom), fluent=prevent_atom, value=TRUE()))
    #             E.append(Effect(condition=And(phi, prevent_atom), fluent=FluentExp(dead_end_fluent), value=TRUE()))
            
    #         elif c.is_sometime_before():
    #             assert len(self._monitoring_atom_dict[c]) == 1
    #             seen_atom = self._monitoring_atom_dict[c][0]
    #             psi = c.args[1]
    #             E.append(Effect(condition=And(phi, Not(seen_atom)), fluent=FluentExp(dead_end_fluent), value=TRUE()))
    #             E.append(Effect(condition=psi, fluent=seen_atom, value=TRUE()))

    #         elif c.is_sometime_after():
    #             assert len(self._monitoring_atom_dict[c]) == 1
    #             hold_atom = self._monitoring_atom_dict[c][0]
    #             psi = c.args[1]
    #             E.append(Effect(condition=And(phi, Not(psi)), fluent=hold_atom, value=FALSE()))
    #             E.append(Effect(condition=psi, fluent=hold_atom, value=TRUE()))

        
        
    #     end_action = InstantaneousAction("end")
    #     end_fluent = Fluent("end_fluent", BoolType())
    #     end_fluent_expr = FluentExp(end_fluent)
    #     for eff in E:
    #         end_action.effects.append(eff)
    #     end_action.add_effect(condition=TRUE(), fluent=end_fluent, value=TRUE())
    #     end_action.add_precondition(precondition=Not(dead_end_fluent))

    #     self._problem.add_action(end_action)

    #     trace_back_map: Dict[Action, Tuple[Action, List[FNode]]] = {}
    #     for a in self._problem.actions:
    #         trace_back_map[a] = a
    #         assert isinstance(a, InstantaneousAction)
    #         for eff in E:
    #             a.effects.append(eff)
    #         a.add_precondition(precondition=Not(dead_end_fluent))
    #         a.add_precondition(precondition=Not(end_fluent))

    #     for fluent in monitoring_atoms + [dead_end_fluent, end_fluent]:
    #         self._problem.add_fluent(fluent)

    #     G_new = (And(self._problem.goals, G_prime, end_fluent_expr, Not(dead_end_fluent))).simplify()
    #     self._problem.clear_goals()
    #     self._problem.add_goal(G_new)
    #     self._problem.clear_trajectory_constraints()
    #     return CompilerResult(self._problem, partial(lift_action_instance, map=trace_back_map), self.name)


    def _compile(
        self,
        problem: "up.model.AbstractProblem",
        compilation_kind: "up.engines.CompilationKind",
    ) -> CompilerResult:
        """
        Takes an instance of a :class:`~unified_planning.model.Problem` and the `TRAJECTORY_CONSTRAINTS_REMOVING` :class:`~unified_planning.engines.CompilationKind`
        and returns a `CompilerResult` where the problem whitout trajectory_constraints.

        :param problem: The instance of the `Problem` that contains the trajecotry constraints.
        :param compilation_kind: The `CompilationKind` that must be applied on the given problem;
            only `TRAJECTORY_CONSTRAINTS_REMOVING` is supported by this compiler
        :return: The resulting `CompilerResult` data structure.
        """
        assert isinstance(problem, Problem)
        env = problem.env
        assert isinstance(env, Environment)
        expression_quantifier_remover = ExpressionQuantifiersRemover(problem.env)
        self._problem = problem.clone()
        self._problem.name = f"{self.name}_{problem.name}"

        C = build_constraint_list(expression_quantifier_remover, self._problem)
        dead_end_fluent = Fluent(DEAD_END, BoolType())
        # create a list that contains trajectory_constraints
        # trajectory_constraints can contain quantifiers that need to be removed
        if len(C) == 1 and C[0] == True:
            raise Exception("No trajectory constraints to remove")
        
        monitoring_atoms, monitoring_atom_dict = self._get_monitoring_atoms(C)

        self._monitoring_atom_dict = monitoring_atom_dict

        G_prime = And(*[self._monitoring_atom_dict[c] for c in get_landmark_constraints(C)])
        
        E: List["up.model.effect.Effect"] = list()
        P = list()
        for c in C:
            phi = c.args[0]

            if c.is_always():
                P.append(phi)

            elif c.is_sometime():
                assert len(self._monitoring_atom_dict[c]) == 1
                hold_atom = self._monitoring_atom_dict[c][0]
                E.append(Effect(condition=phi, fluent=hold_atom, value=TRUE()))

            elif c.is_at_most_once():
                assert len(self._monitoring_atom_dict[c]) == 2
                seen_atom = self._monitoring_atom_dict[c][0]
                prevent_atom = self._monitoring_atom_dict[c][1]
                E.append(Effect(condition=phi, fluent=seen_atom, value=TRUE()))
                E.append(Effect(condition=And(Not(phi), seen_atom), fluent=prevent_atom, value=TRUE()))
                P.append(Not(And(phi, prevent_atom)))
            
            elif c.is_sometime_before():
                assert len(self._monitoring_atom_dict[c]) == 1
                seen_atom = self._monitoring_atom_dict[c][0]
                psi = c.args[1]
                E.append(Effect(condition=psi, fluent=seen_atom, value=TRUE()))
                P.append(Or(Not(phi), seen_atom))

            elif c.is_sometime_after():
                assert len(self._monitoring_atom_dict[c]) == 1
                hold_atom = self._monitoring_atom_dict[c][0]
                psi = c.args[1]
                E.append(Effect(condition=And(phi, Not(psi)), fluent=hold_atom, value=FALSE()))
                E.append(Effect(condition=psi, fluent=hold_atom, value=TRUE()))

        
        
        end_action = InstantaneousAction("end_action")
        end_fluent = Fluent("end_fluent", BoolType())
        end_fluent_expr = FluentExp(end_fluent)
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
        return CompilerResult(self._problem, partial(lift_action_instance, map=trace_back_map), self.name), None

    def _get_monitoring_atoms(self, C: list[FNode]):
        monitoring_atoms = []
        monitoring_atom_dict = {}
        monitoring_atoms_counter = 0
        for constr in C:
            
            fluents = None
            if constr.is_sometime():
                fluents = [Fluent(f"{HOLD}{SEPARATOR}{monitoring_atoms_counter}", BoolType())]
            elif constr.is_at_most_once():
                fluents = [Fluent(f"{SEEN_PHI}{SEPARATOR}{monitoring_atoms_counter}", BoolType()), 
                           Fluent(f"{PREVENT_PHI}{SEPARATOR}{monitoring_atoms_counter}", BoolType())]
            elif constr.is_sometime_after():
                fluents = [Fluent(f"{HOLD}{SEPARATOR}{monitoring_atoms_counter}", BoolType())]
            elif constr.is_sometime_before():
                fluents = [Fluent(f"{SEEN_PSI}{SEPARATOR}{monitoring_atoms_counter}", BoolType())]

            if fluents is not None:
                monitoring_atoms += fluents
                monitoring_atoms_of_c = [FluentExp(fluent) for fluent in fluents]
                monitoring_atom_dict[constr] = monitoring_atoms_of_c
                monitoring_atoms_counter += len(fluents)
        return monitoring_atoms, monitoring_atom_dict