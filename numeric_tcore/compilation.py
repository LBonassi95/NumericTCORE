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
from unified_planning.model.state import State, UPState
from unified_planning.environment import Environment
from unified_planning.shortcuts import *
from functools import partial
from unified_planning.engines.compilers.utils import (
    lift_action_instance,
)
from typing import List, Dict, Tuple
from numeric_tcore.numeric_regression import regression
from numeric_tcore.compilation_helper import *
from numeric_tcore.achievers_helper import *
from numeric_tcore.parsing_extensions import PDDL3QuantitativeProblem, Within

NUM = "num"
CONSTRAINTS = "constraints"
HOLD = "hold"
GOAL = "goal"
SEEN_PHI = "seen-phi"
SEEN_PSI = "seen-psi"
SEPARATOR = "-"
UNKNOWN_CONSTRAINT_ERROR_MSG = "ERROR This compiler cannot handle this constraint = {}"

class NumericCompiler(engines.engine.Engine, CompilerMixin):
    """
    TrajectoryConstraintsRemover class: the `TrajectoryConstraintsRemover` takes a :class:`~unified_planning.model.Problem`
    that contains 'trajectory_constraints' and returns a new grounded 'Problem' without those constraints.

    The compiler, for each trajectory_constraints manages 'Actions' (precondition and effects) and 'Goals'.

    This `Compiler` supports only the the `TRAJECTORY_CONSTRAINTS_REMOVING` :class:`~unified_planning.engines.CompilationKind`.
    """

    def __init__(self, achiever_computation_strategy = REGRESSION):
        engines.engine.Engine.__init__(self)
        CompilerMixin.__init__(self, CompilationKind.TRAJECTORY_CONSTRAINTS_REMOVING)
        self._monitoring_atom_dict: Dict[
            "up.model.fnode.FNode", "up.model.fnode.FNode"
        ] = {}
        self.achiever_computation_strategy = achiever_computation_strategy
        self.achiever_helper = None

    @property
    def name(self):
        return "TrajectoryConstraintsRemover"

    @staticmethod
    def supports(problem_kind):
        #return problem_kind <= NumericCompiler.supported_kind()
        return True
    
    @staticmethod
    def resulting_problem_kind(
        problem_kind: ProblemKind, compilation_kind: Optional[CompilationKind] = None
    ) -> ProblemKind:
        new_kind = ProblemKind(problem_kind.features)
        if new_kind.has_trajectory_constraints() or new_kind.has_state_invariants():
            new_kind.unset_constraints_kind("TRAJECTORY_CONSTRAINTS")
            new_kind.unset_constraints_kind("STATE_INVARIANTS")
            new_kind.set_conditions_kind("NEGATIVE_CONDITIONS")
            new_kind.set_conditions_kind("DISJUNCTIVE_CONDITIONS")
        return new_kind

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

        count_true = False
        print("COUNT TRUE = {}".format(count_true))

        logger = Logger()

        quantitative_constraints = []
        if isinstance(problem, PDDL3QuantitativeProblem):
            quantitative_constraints = problem.quantitative_constraints
            problem = problem.problem

        assert isinstance(problem, Problem)
        env = problem.environment
        assert isinstance(env, Environment)
        expression_quantifier_remover = ExpressionQuantifiersRemover(env)
        self._grounding_result = Grounder().compile(
            problem, CompilationKind.GROUNDING
        )
        assert isinstance(self._grounding_result.problem, Problem)
        self.achiever_helper = AchieverHelper(self.achiever_computation_strategy, self._grounding_result.problem.clone())
        self._problem = self._grounding_result.problem.clone()
        self._problem.name = f"{self.name}_{problem.name}"
        actions = self._problem.actions
        initial_state = self._problem.initial_values
        constraints = build_constraint_list(
            expression_quantifier_remover, self._problem
        )
        if isinstance(constraints, tuple):
            constraints = list(constraints)
        # create a list that contains trajectory_constraints
        # trajectory_constraints can contain quantifiers that need to be removed
        if len(constraints) == 1 and (constraints[0] == True or constraints[0] == TRUE()):
            constraints = []

        if len(constraints) == 0 and len(quantitative_constraints) == 0:
            raise Exception("No trajectory constraints to remove")

        # REGISTER CONSTRAINTS IN LOGGER #
        logger.qualitative_constraints = [c for c in constraints]
        
        # MANAGE THE TIME FLUENT #
        self.time_fluent = Fluent("time", RealType())
        self._problem.add_fluent(self.time_fluent)
        self._problem.set_initial_value(self.time_fluent, 0)
        ##########################

        at_end_constraints = []
        always_within = []
        if len(quantitative_constraints) > 0:
            quantitative_constraints = ground_quantitative_constraints(expression_quantifier_remover, quantitative_constraints, self._problem)
            # REGISTER CONSTRAINTS IN LOGGER #
            logger.quantitative_constraints = [c for c in quantitative_constraints]
            always_within = [c for c in quantitative_constraints if isinstance(c, AlwaysWithin)]
            constraints += reformulate_quantitative_constraints(quantitative_constraints, self.time_fluent)
            at_end_constraints = [c for c in constraints if isinstance(c, AtEnd)]
            constraints = [c for c in constraints if not isinstance(c, AtEnd)]
        

        var2constraints_dict = self._build_var2constraints_dict(env, constraints)
        state_evaluator = StateEvaluator(self._problem)

        actions_prime: List["up.model.effect.Effect"] = list()

        ############# ADDITIONAL VARIABLES CREATION #############
        initial_state_prime, f_prime = self._get_monitoring_atoms(state_evaluator, constraints, UPState(initial_state))
        initial_mark_values, f_prime_always_within = self._get_monitoring_atoms_always_within(state_evaluator, always_within, UPState(initial_state))
        #########################################################

        ############# NEW GOAL CREATION #############
        goal_prime = And([self._monitoring_atom_dict[c] for c in get_landmark_constraints(constraints)] + 
                         [ae.formula for ae in at_end_constraints] + 
                         [Equals(self._monitoring_atom_dict[c], -1) for c in always_within])
        #############################################

        ############# BOOKKEEPING #############
        trace_back_map: Dict[Action, Tuple[Action, List[FNode]]] = {}
        assert isinstance(self._grounding_result.map_back_action_instance, partial)
        map_grounded_action = self._grounding_result.map_back_action_instance.keywords["map"]
        #######################################

        logger.actions = len(actions)
        for a in actions:
            
            logger.original_precondition_size += get_formula_size(And(*[a.preconditions]), count_true)
            for eff in a.effects:
                if eff.condition != TRUE():
                    logger.original_effect_size += get_formula_size(eff.condition, count_true)
            
            map_value = map_grounded_action[a]
            assert isinstance(a, InstantaneousAction)

            a.add_increase_effect(self.time_fluent, 1)

            if self.achiever_computation_strategy != NAIVE:
                relevant_constraints = self._get_relevant_constraints(a, var2constraints_dict)
                # relevant_constraints containts the constraints which have as argument formulas with at least one variable affected by the action
                # If a constraint is defined over varibles not appearing in the effect of the action, then the regression will leave the formula(s) unchanged.
                # Example always (x > 0) \vee (x < 10). If x does not appear in the effect of an action "a", then R((x > 0) \vee (x < 10), a) = (x > 0) \vee (x < 10)
                # Wether or not an action "a" is actually an achiever is checked later.
            else:
                # If the achiever computation strategy is NAIVE, then all the constraints are relevant
                relevant_constraints = constraints
                
            new_P, new_E = self._get_preconditions_and_effects(relevant_constraints, a, env)
            new_P, new_E = self._get_preconditions_and_effects_always_within(always_within, a, new_P, new_E)
            
            if count_true:
                logger.new_preconditions += len(new_P)
            else:
                logger.new_preconditions += len([p for p in new_P if p != TRUE()])
            logger.new_effects += len(new_E)

            for pre in new_P:
                logger.new_precondition_size += get_formula_size(pre.simplify(), count_true)
                if pre != TRUE():
                    a.preconditions.append(pre)

            for eff in new_E:
                a.effects.append(eff)
                assert isinstance(eff, Effect)
                # if eff.condition != TRUE():
                logger.new_effect_size += get_formula_size(eff.condition.simplify(), count_true)
                logger.new_effect_size += get_formula_size(eff.fluent.simplify(), count_true)
                logger.new_effect_size += get_formula_size(eff.value.simplify(), count_true)

            if FALSE() not in a.preconditions:
                actions_prime.append(a)
            trace_back_map[a] = map_value
        # create new problem to return
        # adding new fluents, goal, initial values and actions
        
        logger.original_goal_size = get_formula_size(And(*[self._problem.goals]), count_true)
        #if goal_prime != TRUE():
        logger.new_goal_size = get_formula_size(goal_prime, count_true)
        new_goal = (And(self._problem.goals, goal_prime)).simplify()
        self._problem.clear_goals()
        self._problem.add_goal(new_goal)
        self._problem.clear_trajectory_constraints()

        logger.fluents = len(self._problem.fluents) - 1
        
        for fluent in f_prime:
            self._problem.add_fluent(fluent)

        for fluent in f_prime_always_within:
            self._problem.add_fluent(fluent)

        logger.new_fluents = len(self._problem.fluents) - logger.fluents
        
        self._problem.clear_actions()
        for action in actions_prime:
            self._problem.add_action(action)

        for init_val in initial_state_prime:
            self._problem.set_initial_value(
                Fluent(f"{init_val}", BoolType()), True
            )
        for mark, val in initial_mark_values.items():
            self._problem.set_initial_value(mark, val)

        return CompilerResult(
            self._problem, partial(lift_action_instance, map=trace_back_map), self.name
        ), logger
    
    def _get_preconditions_and_effects(self, relevant_constraints, a, env):
        new_P = []
        new_E = []
        for c in relevant_constraints:
            assert isinstance(c, FNode)

            if c.is_always():
                self._compile_always(a, c, new_P)

            elif c.is_at_most_once():
                self._compile_amo(a, c, new_P, new_E)

            elif c.is_sometime_before():
                self._compile_sb(a, c, new_P, new_E)

            elif c.is_sometime():
                self._compile_sometime(a, c, new_E)

            elif c.is_sometime_after():
                self._compile_sa(a, c, new_E)
            else:
                raise Exception(
                    UNKNOWN_CONSTRAINT_ERROR_MSG.format(c)
                )
            
        return new_P, new_E

    def _get_preconditions_and_effects_always_within(self, always_within, a, new_P, new_E):
        for c in always_within:
            assert isinstance(c, AlwaysWithin)
            self._compile_always_within(a, c, new_P, new_E)
        return new_P, new_E

    def _compile_always_within(self, a: InstantaneousAction, c: AlwaysWithin, new_P: list, new_E: list):
        t = c.t
        phi = c.formula1
        psi = c.formula2
        mark = self._monitoring_atom_dict[c]
        
        pre = Or(Equals(mark, -1), LT(Minus(FluentExp(self.time_fluent), mark), t))

        if self.achiever_helper.isAchiever(a, And([phi, Not(psi)])):
            r_phi_and_not_psi_and_mark = And(regression(And([phi, Not(psi)]), a).simplify(), 
                                         Equals(mark, -1)
                                         ).simplify()
            self._add_numeric_cond_eff(new_E, r_phi_and_not_psi_and_mark, mark, Plus(FluentExp(self.time_fluent), 1))
        
        if self.achiever_helper.isAchiever(a, psi):
            r_psi_a = regression(psi, a).simplify()
            self._add_numeric_cond_eff(new_E, r_psi_a, mark, Int(-1))

        new_P.append(pre)



    def _compile_sa(self, a: InstantaneousAction, c: FNode, new_E: list):
        phi = c.args[0]
        psi = c.args[1]
        hold_c = self._monitoring_atom_dict[c]
        if self.achiever_helper.isAchiever(a, And([phi, Not(psi)])):
            r_phi_and_not_psi_a = regression(And([phi, Not(psi)]), a).simplify()
            self._add_cond_eff(new_E, r_phi_and_not_psi_a, Not(hold_c))
        if self.achiever_helper.isAchiever(a, psi):
            r_psi_a = regression(psi, a).simplify()
            self._add_cond_eff(new_E, r_psi_a, hold_c)

    def _compile_sometime(self, a: InstantaneousAction, c: FNode, new_E: list):
        phi = c.args[0]
        hold_c = self._monitoring_atom_dict[c]
        if self.achiever_helper.isAchiever(a, phi):
            r_phi_a = regression(phi, a).simplify()
            self._add_cond_eff(new_E, r_phi_a, hold_c)

    def _compile_sb(self, a: InstantaneousAction, c: FNode, new_P: list, new_E: list):
        phi = c.args[0]
        psi = c.args[1]
        seen_psi = self._monitoring_atom_dict[c]
        
        if self.achiever_helper.isAchiever(a, phi):
            r_phi_a = regression(phi, a).simplify()
            new_P.append(Or([Not(r_phi_a), seen_psi]).simplify())
        if self.achiever_helper.isAchiever(a, psi):
            r_psi_a = regression(psi, a).simplify()
            self._add_cond_eff(new_E, r_psi_a, seen_psi)


    def _compile_amo(self, a: InstantaneousAction, c: FNode, new_P: list, new_E: list):
        phi = c.args[0]
        seen_phi = self._monitoring_atom_dict[c]
        if self.achiever_helper.isAchiever(a, phi):
            r_phi_a = (regression(phi, a)).simplify()
            new_P.append(Or([Not(r_phi_a), Not(seen_phi), phi]).simplify())
            self._add_cond_eff(new_E, r_phi_a, seen_phi)
            
    #@profile
    def _compile_always(self, a: InstantaneousAction, c: FNode, new_P: list):
        phi = c.args[0]
        if self.achiever_helper.isAchiever(a, Not(phi)):
            new_P.append((regression(phi, a)).simplify())

    def _add_cond_eff(self, new_E: list, cond: FNode, eff):
        if not cond.simplify().is_false():
            if eff.is_not():
                new_E.append(
                    up.model.Effect(
                        condition=cond,
                        fluent=eff.args[0],
                        value=FALSE(),))
            else:
                new_E.append(
                    up.model.Effect(
                        condition=cond,
                        fluent=eff,
                        value=TRUE(),))
    
    def _add_numeric_cond_eff(self, new_E: list, cond: FNode, fluent: FNode, value: FNode):
        new_E.append(up.model.Effect(
                        condition=cond,
                        fluent=fluent,
                        value=value))

    def _get_relevant_constraints(self, a: InstantaneousAction, var2constraints_dict: Dict) -> list[FNode]:
        '''
        Returns the list of constraints relevant to the action a;
        A constraints is deemed releveant when the argument formula contains at least one variable which is affected by a.
        If an action "a" and a formula \phi do not share any variable, then we have R(\phi, a) = \phi.
        We could check this by checking R(\phi, a) = \phi for every action "a" and every constraint featuring \phi, but this would be very inefficient.
        
        '''
        relevant_constrains = []
        for eff in a.effects:
            constr = var2constraints_dict.get(eff.fluent, [])
            for c in constr:
                if c not in relevant_constrains:
                    relevant_constrains.append(c)
        return relevant_constrains

    def _check_itc_violated_in_init(self, violation_condition: bool, constraint: str) -> bool:
        if violation_condition:
            raise UPProblemDefinitionError(
                "PROBLEM NOT SOLVABLE: an {} is violated in the initial state".format(constraint))

    def _evaluate_constraint(self, state_evaluator: StateEvaluator, constr: FNode, initial_state: UPState):
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

    def _get_monitoring_atoms(self, state_evaluator: StateEvaluator, C: list[FNode], I: UPState):
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

    def _get_monitoring_atoms_always_within(self, state_evaluator: StateEvaluator, always_within: list[AlwaysWithin], I: UPState):
        monitoring_atoms = []
        always_within_counter = 0
        initial_marks_value = {}
        for aw in always_within:
            phi_init_value = state_evaluator.evaluate(aw.formula1, I)
            psi_init_value = state_evaluator.evaluate(aw.formula2, I)
            
            start_with_mark = phi_init_value.is_true() and not psi_init_value.is_true()
            fluent = Fluent(f"mark{SEPARATOR}{always_within_counter}", IntType())
            monitoring_atoms.append(fluent)
            monitoring_atom = FluentExp(fluent)
            self._monitoring_atom_dict[aw] = monitoring_atom
            if start_with_mark:
                initial_marks_value[fluent] = 0
            else:
                initial_marks_value[fluent] = -1
            
            if initial_marks_value[fluent] >= int(str(aw.t)):
                raise UPProblemDefinitionError(
                    "PROBLEM NOT SOLVABLE: an always-within constraint is violated in the initial state")

            always_within_counter += 1
        return initial_marks_value, monitoring_atoms

    def _build_var2constraints_dict(self, env: Environment, C: list[FNode]):
        '''
        Builds a dictionary that maps each variable to the list of constraints featuring that variable.
        '''
        assert isinstance(env.free_vars_extractor, FreeVarsExtractor)
        var2constraints_dict = {}
        for c in C:
            for atom in env.free_vars_extractor.get(c):
                conditions_list = var2constraints_dict.setdefault(atom, [])
                conditions_list.append(c)
        return var2constraints_dict
