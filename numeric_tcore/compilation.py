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


NUM = "num"
CONSTRAINTS = "constraints"
HOLD = "hold"
GOAL = "goal"
SEEN_PHI = "seen-phi"
SEEN_PSI = "seen-psi"
SEPARATOR = "-"


class NumericCompiler(engines.engine.Engine, CompilerMixin):
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
        self._grounding_result = Grounder().compile(
            problem, CompilationKind.GROUNDING
        )
        assert isinstance(self._grounding_result.problem, Problem)
        self._problem = self._grounding_result.problem.clone()
        self._problem.name = f"{self.name}_{problem.name}"
        A = self._problem.actions
        I = self._problem.initial_values
        C = self._build_constraint_list(
            expression_quantifier_remover, self._problem.trajectory_constraints
        )
        # create a list that contains trajectory_constraints
        # trajectory_constraints can contain quantifiers that need to be removed
        relevancy_dict = self._build_relevancy_dict(env, C)
        A_prime: List["up.model.effect.Effect"] = list()
        state_evaluator = StateEvaluator(self._problem)
        I_prime, F_prime = self._get_monitoring_atoms(state_evaluator, C, UPCOWState(I))
        G_prime = And([self._monitoring_atom_dict[c] for c in self._get_landmark_constraints(C)])
        trace_back_map: Dict[Action, Tuple[Action, List[FNode]]] = {}
        assert isinstance(self._grounding_result.map_back_action_instance, partial)
        map_grounded_action = self._grounding_result.map_back_action_instance.keywords["map"]
        for a in A:
            map_value = map_grounded_action[a]
            assert isinstance(a, InstantaneousAction)
            E = []
            relevant_constraints = self._get_relevant_constraints(a, relevancy_dict)
            for c in relevant_constraints:
                # manage the action for each trajectory_constraints that is relevant
                if c.is_always():
                    precondition, to_add = self._manage_always_compilation(
                        env, c.args[0], a
                    )
                elif c.is_at_most_once():
                    precondition, to_add = self._manage_amo_compilation(
                        env, c.args[0], self._monitoring_atom_dict[c], a, E
                    )
                elif c.is_sometime_before():
                    precondition, to_add = self._manage_sb_compilation(
                        env, c.args[0], c.args[1], self._monitoring_atom_dict[c], a, E
                    )
                elif c.is_sometime():
                    self._manage_sometime_compilation(
                        env, c.args[0], self._monitoring_atom_dict[c], a, E
                    )
                elif c.is_sometime_after():
                    self._manage_sa_compilation(
                        env, c.args[0], c.args[1], self._monitoring_atom_dict[c], a, E
                    )
                else:
                    raise Exception(
                        f"ERROR This compiler cannot handle this constraint = {c}"
                    )
                if c.is_always() or c.is_at_most_once() or c.is_sometime_before():
                    if to_add and not precondition.is_true():
                        a.preconditions.append(precondition)
            for eff in E:
                a.effects.append(eff)
            if FALSE() not in a.preconditions:
                A_prime.append(a)
            trace_back_map[a] = map_value
        # create new problem to return
        # adding new fluents, goal, initial values and actions
        G_new = (And(self._problem.goals, G_prime)).simplify()
        self._problem.clear_goals()
        self._problem.add_goal(G_new)
        self._problem.clear_trajectory_constraints()
        for fluent in F_prime:
            self._problem.add_fluent(fluent)
        self._problem.clear_actions()
        for action in A_prime:
            self._problem.add_action(action)
        for init_val in I_prime:
            self._problem.set_initial_value(
                Fluent(f"{init_val}", BoolType()), True
            )
        return CompilerResult(
            self._problem, partial(lift_action_instance, map=trace_back_map), self.name
        )

    def _build_constraint_list(self, expression_quantifier_remover, constraints):
        C_temp = (And(constraints)).simplify()
        C_list = C_temp.args if C_temp.is_and() else [C_temp]
        C_to_return = (And(self._remove_quantifier(expression_quantifier_remover, C_list))).simplify()
        return C_to_return.args if C_to_return.is_and() else [C_to_return]

    def _remove_quantifier(self, expression_quantifier_remover, C):
        new_C = []
        for c in C:
            assert c.node_type is not OperatorKind.EXISTS
            new_C.append(
                expression_quantifier_remover.remove_quantifiers(c, self._problem)
            )
        return new_C

    def _manage_sa_compilation(self, env, phi, psi, m_atom, a, E):
        R1 = (regression(phi, a)).simplify()
        R2 = (regression(psi, a)).simplify()
        if phi != R1 or psi != R2:
            cond = (
                And([R1, Not(R2)])
            ).simplify()
            self._add_cond_eff(env, E, cond, Not(m_atom))
        if psi != R2:
            self._add_cond_eff(env, E, R2, m_atom)

    def _manage_sometime_compilation(self, env, phi, m_atom, a, E):
        R = (regression(phi, a)).simplify()
        if R != phi:
            self._add_cond_eff(env, E, R, m_atom)

    def _manage_sb_compilation(self, env, phi, psi, m_atom, a, E):
        R_phi = (regression(phi, a)).simplify()
        if R_phi == phi:
            added_precond = (None, False)
        else:
            rho = (Or([Not(R_phi), m_atom])).simplify()
            added_precond = (rho, True)
        R_psi = (regression(psi, a)).simplify()
        if R_psi != psi:
            self._add_cond_eff(env, E, R_psi, m_atom)
        return added_precond

    def _manage_amo_compilation(self, env, phi, m_atom, a, E):
        R = (regression(phi, a)).simplify()
        if R == phi:
            return None, False
        else:
            rho = (
                Or(
                    [
                        Not(R),
                        Not(m_atom),
                        phi,
                    ]
                )
            ).simplify()
            self._add_cond_eff(env, E, R, m_atom)
            return rho, True

    def _manage_always_compilation(self, env, phi, a):
        R = (regression(phi, a)).simplify()
        if R == phi:
            return None, False
        else:
            return R, True

    def _add_cond_eff(self, env, E, cond, eff):
        if not cond.simplify().is_false():
            if eff.is_not():
                E.append(
                    up.model.Effect(
                        condition=cond,
                        fluent=eff.args[0],
                        value=FALSE(),
                    )
                )
            else:
                E.append(
                    up.model.Effect(
                        condition=cond,
                        fluent=eff,
                        value=TRUE(),
                    )
                )

    def _get_relevant_constraints(self, a: InstantaneousAction, relevancy_dict: Dict) -> list[FNode]:
        relevant_constrains = []
        for eff in a.effects:
            constr = relevancy_dict.get(eff.fluent, [])
            for c in constr:
                if c not in relevant_constrains:
                    relevant_constrains.append(c)
        return relevant_constrains

    def _check_itc_violated_in_init(self, violation_condition: bool, constraint: str) -> bool:
        if violation_condition:
            raise UPProblemDefinitionError(
                "PROBLEM NOT SOLVABLE: an {} is violated in the initial state".format(constraint))

    def _evaluate_constraint(self, state_evaluator: StateEvaluator, constr: FNode, initial_state: ROState):
        phi_init_value = state_evaluator.evaluate(constr.args[0], initial_state)
        if constr.is_always():
            self._check_itc_violated_in_init(phi_init_value.is_false(), "always")
            return None, phi_init_value
        elif constr.is_sometime():
            return HOLD, phi_init_value
        elif constr.is_at_most_once():
            return SEEN_PHI, phi_init_value
        elif constr.is_sometime_after():
            psi_init_value = state_evaluator.evaluate(constr.args[1], initial_state)
            return HOLD, psi_init_value or not phi_init_value
        elif constr.is_sometime_before():
            self._check_itc_violated_in_init(phi_init_value.is_true(), "sometime-before")
            psi_init_value = state_evaluator.evaluate(constr.args[1], initial_state)
            return SEEN_PSI, psi_init_value
        else:
            raise UPProblemDefinitionError(
                        "The constraint {} is not supported by the compiler"
                        .format(str(constr))
                    )

    def _get_monitoring_atoms(self, state_evaluator: StateEvaluator, C: list[FNode], I: ROState):
        monitoring_atoms = []
        monitoring_atoms_counter = 0
        initial_state_prime = []
        for constr in C:
            type, init_state_value = self._evaluate_constraint(
                state_evaluator, constr, I
            )
            # TYPE IS NONE IF THE CONSTRAINT IS ALWAYS
            if type is not None:
                fluent = Fluent(
                    f"{type}{SEPARATOR}{monitoring_atoms_counter}", BoolType())
                monitoring_atoms.append(fluent)
                monitoring_atom = FluentExp(fluent)
                self._monitoring_atom_dict[constr] = monitoring_atom
                if init_state_value.is_true():
                    initial_state_prime.append(monitoring_atom)
                monitoring_atoms_counter += 1
        return initial_state_prime, monitoring_atoms

    def _build_relevancy_dict(self, env: Environment, C: list[FNode]):
        assert isinstance(env.free_vars_extractor, FreeVarsExtractor)
        relevancy_dict = {}
        for c in C:
            for atom in env.free_vars_extractor.get(c):
                conditions_list = relevancy_dict.setdefault(atom, [])
                conditions_list.append(c)
        return relevancy_dict

    def _get_all_atoms(self, condition):
        if condition.is_fluent_exp():
            return [condition]
        elif condition.is_and() or condition.is_or() or condition.is_not():
            atoms = []
            for arg in condition.args:
                atoms += self._get_all_atoms(arg)
            return atoms
        else:
            return []

    def _get_landmark_constraints(self, C):
        for constr in C:
            if constr.is_sometime() or constr.is_sometime_after():
                yield constr

    # def _gamma_substitution(self, env, literal, action):
    #     negated_literal = env.expression_manager.Not(expression=literal)
    #     gamma1 = self._gamma(env, literal, action)
    #     gamma2 = env.expression_manager.Not(self._gamma(env, negated_literal, action))
    #     conjunction = env.expression_manager.And([literal, gamma2])
    #     return env.expression_manager.Or([gamma1, conjunction])

    # def _gamma(self, env, literal, action):
    #     disjunction = []
    #     for eff in action.effects:
    #         cond = eff.condition
    #         if eff.value.is_false():
    #             eff = env.expression_manager.Not(eff.fluent)
    #         else:
    #             eff = eff.fluent
    #         if literal == eff:
    #             if cond.is_true():
    #                 return env.expression_manager.TRUE()
    #             disjunction.append(cond)
    #     if not disjunction:
    #         return False
    #     return env.expression_manager.Or(disjunction)

    # def _regression(self, env, phi, action):
    #     if phi.is_false() or phi.is_true():
    #         return phi
    #     elif phi.is_fluent_exp():
    #         return self._gamma_substitution(env, phi, action)
    #     elif phi.is_or():
    #         return env.expression_manager.Or(
    #             [self._regression(env, component, action) for component in phi.args]
    #         )
    #     elif phi.is_and():
    #         return env.expression_manager.And(
    #             [self._regression(env, component, action) for component in phi.args]
    #         )
    #     elif phi.is_not():
    #         return env.expression_manager.Not(self._regression(env, phi.arg(0), action))
    #     else:
    #         raise up.exceptions.UPUsageError(
    #             "This compiler cannot handle this expression"
    #         )
