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
from unified_planning.engines.results import CompilerResult
from unified_planning.engines.compilers.grounder import Grounder
from unified_planning.model import InstantaneousAction, FNode
from unified_planning.model.walkers import FreeVarsExtractor
from unified_planning.model import Problem, ProblemKind
from unified_planning.model.operators import OperatorKind
from unified_planning.model.walkers.state_evaluator import StateEvaluator
from unified_planning.model.state import UPState
from unified_planning.environment import Environment
from unified_planning.shortcuts import BoolType, Effect, Int, Minus, IntType
from unified_planning.engines.compilers.utils import (
    lift_action_instance,
)
from numeric_tcore.constraints import *
from typing import List, Dict, Tuple
from numeric_tcore.numeric_regression import regression
from numeric_tcore.compilation_helper import *
from numeric_tcore.achievers_helper import *
from numeric_tcore.parsing_extensions import PDDL3Problem, AlwaysWithin
from unified_planning.model.walkers import Substituter, ExpressionQuantifiersRemover

NUM = "num"
CONSTRAINTS = "constraints"
HOLD = "hold"
GOAL = "goal"
SEEN_PHI = "seen-phi"
SEEN_PSI = "seen-psi"
SEPARATOR = "-"
GROUNDING_ERROR_MSG = "Error during the grounding phase"
UNKNOWN_CONSTRAINT_ERROR_MSG = "ERROR This compiler cannot handle this constraint = {}"

class NumericCompiler:
    """
    Main class of the NTCORE compiler. It removes trajectory constraints from a PDDL3 problem.
    """

    def __init__(self, achiever_strategy = NAIVE):
        self._monitoring_atom_dict: Dict[
            "up.model.fnode.FNode", "up.model.fnode.FNode"
        ] = {}
        self.achiever_strategy = achiever_strategy
        self.achiever_helper = None
    
    def compile(self, pddl3_problem: PDDL3Problem) -> Tuple[CompilerResult, Logger]:
        """
        Transforms a PDDL3 problem into a new problem without trajectory constraints. 
        """

        count_true = False
        logger = Logger()

        time_constraints = pddl3_problem.time_constraints

        self.ground_problem = pddl3_problem.ground_problem.clone()
        self.ground_problem.name = f"compiled_{self.ground_problem.name}"
        self.env = pddl3_problem.env

        quantifier_remover = ExpressionQuantifiersRemover(self.env)

        qualitative_constraints = pddl3_problem.qualitative_constraints

        self.achiever_helper = AchieverHelper(self.achiever_strategy, self.ground_problem)
        
        actions = self.ground_problem.actions
        initial_state = self.ground_problem.initial_values

        # REGISTER CONSTRAINTS IN LOGGER #
        logger.qualitative_constraints = [c for c in qualitative_constraints]
        logger.time_constraints = [c for c in time_constraints]
        ##################################
        
        # MANAGE THE TIME FLUENT #
        self.time_fluent = Fluent("time", RealType())
        self.ground_problem.add_fluent(self.time_fluent)
        self.ground_problem.set_initial_value(self.time_fluent, 0)
        ##########################

        new_qualitative_constraints, always_within, at_end = normalize_time_constraints(quantifier_remover, time_constraints, self.time_fluent, self.ground_problem)
        qualitative_constraints += new_qualitative_constraints
        
        self.var2constraints_dict = self._build_var2constraints_dict(self.env, qualitative_constraints)
        state_evaluator = StateEvaluator(self.ground_problem)

        actions_prime: List["up.model.effect.Effect"] = list()

        ############# ADDITIONAL VARIABLES CREATION #############
        initial_state_prime, f_prime = self._get_monitoring_atoms(state_evaluator, qualitative_constraints, UPState(initial_state))
        initial_mark_values, f_prime_always_within = self._get_monitoring_atoms_always_within(state_evaluator, always_within, UPState(initial_state))
        #########################################################

        ############# NEW GOAL CREATION #############
        goal_prime = And([self._monitoring_atom_dict[c] for c in get_landmark_constraints(qualitative_constraints)] + 
                         [ae.formula for ae in at_end] + 
                         [Equals(self._monitoring_atom_dict[c], -1) for c in always_within])
        #############################################

        logger.actions = len(actions)

        actions_prime = [self.compile_action(a, qualitative_constraints, always_within, logger) 
                         for a in actions 
                         if FALSE() not in a.preconditions]
  
        # create new problem to return
        # adding new fluents, goal, initial values and actions
        new_goal = (And(self.ground_problem.goals, goal_prime)).simplify()
        self.ground_problem.clear_goals()
        self.ground_problem.add_goal(new_goal)
        self.ground_problem.clear_trajectory_constraints()

        logger.fluents = len(self.ground_problem.fluents) - 1
        
        self.ground_problem.add_fluents(f_prime + f_prime_always_within)
        self.ground_problem.clear_actions()
        self.ground_problem.add_actions(actions_prime)

        for init_val in initial_state_prime:
            self.ground_problem.set_initial_value(
                Fluent(f"{init_val}", BoolType()), True
            )
        for mark, val in initial_mark_values.items():
            self.ground_problem.set_initial_value(mark, val)

        
        # Gather Information #
        logger.new_fluents = len(self.ground_problem.fluents) - logger.fluents
        logger.new_goal_size = get_formula_size(goal_prime, count_true)
        ######################

        return self.ground_problem, logger
    

    def compile_action(self, a: InstantaneousAction, qualitative_constraints, always_within, logger: Logger):
        logger.original_precondition_size += get_formula_size(And(*[a.preconditions]))
        a.add_increase_effect(self.time_fluent, 1)
        logger.new_effects += 1

        if self.achiever_strategy != NAIVE:
            relevant_constraints = self._get_relevant_constraints(a, self.var2constraints_dict)
            # relevant_constraints containts the constraints which have as argument formulas with at least one variable affected by the action
            # If a constraint is defined over varibles not appearing in the effect of the action, then the regression will leave the formula(s) unchanged.
            # Example always (x > 0) \vee (x < 10). If x does not appear in the effect of an action "a", then R((x > 0) \vee (x < 10), a) = (x > 0) \vee (x < 10)
            # Wether or not an action "a" is actually an achiever is checked later.
        else:
            # If the achiever computation strategy is NAIVE, then all the constraints are relevant
            relevant_constraints = qualitative_constraints
        
        # HACK! All always_within constraints are considered relevant!
        new_P, new_E = self._get_preconditions_and_effects(relevant_constraints + always_within, a, self.env)

        logger.new_preconditions += len([p for p in new_P if p != TRUE()])
        logger.new_effects += len(new_E)

        for pre in new_P:
            logger.new_precondition_size += get_formula_size(pre.simplify())
            if pre != TRUE():
                a.preconditions.append(pre)

        for eff in new_E:
            a.effects.append(eff)
            assert isinstance(eff, Effect)
            # if eff.condition != TRUE():
            logger.new_effect_size += get_formula_size(eff.condition.simplify())
            logger.new_effect_size += get_formula_size(eff.fluent.simplify())
            logger.new_effect_size += get_formula_size(eff.value.simplify())

        return a
    
    def _get_preconditions_and_effects(self, relevant_constraints, a, env):
        new_P = []
        new_E = []
        for c in relevant_constraints:
            
            if type(c) == AlwaysWithin:
                self._compile_always_within(a, c, new_P, new_E)

            elif type(c) == Always:
                self._compile_always(a, c, new_P)

            elif type(c) == AtMostOnce:
                self._compile_amo(a, c, new_P, new_E)

            elif type(c) == SometimeBefore:
                self._compile_sb(a, c, new_P, new_E)

            elif type(c) == Sometime:
                self._compile_sometime(a, c, new_E)

            elif type(c) == SometimeAfter:
                self._compile_sa(a, c, new_E)
            
            else:
                raise Exception(
                    UNKNOWN_CONSTRAINT_ERROR_MSG.format(c)
                )
                
        return new_P, new_E

    # def _get_preconditions_and_effects_always_within(self, always_within, a, new_P, new_E):
    #     for c in always_within:
    #         assert isinstance(c, AlwaysWithin)
    #         self._compile_always_within(a, c, new_P, new_E)
    #     return new_P, new_E

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



    def _compile_sa(self, a: InstantaneousAction, c: SometimeAfter, new_E: list):
        phi = c.formula1
        psi = c.formula2
        hold_c = self._monitoring_atom_dict[c]
        if self.achiever_helper.isAchiever(a, And([phi, Not(psi)])):
            r_phi_and_not_psi_a = regression(And([phi, Not(psi)]), a).simplify()
            self._add_cond_eff(new_E, r_phi_and_not_psi_a, Not(hold_c))
        if self.achiever_helper.isAchiever(a, psi):
            r_psi_a = regression(psi, a).simplify()
            self._add_cond_eff(new_E, r_psi_a, hold_c)

    def _compile_sometime(self, a: InstantaneousAction, c: Sometime, new_E: list):
        phi = c.formula
        hold_c = self._monitoring_atom_dict[c]
        if self.achiever_helper.isAchiever(a, phi):
            r_phi_a = regression(phi, a).simplify()
            self._add_cond_eff(new_E, r_phi_a, hold_c)

    def _compile_sb(self, a: InstantaneousAction, c: SometimeBefore, new_P: list, new_E: list):
        phi = c.formula1
        psi = c.formula2
        seen_psi = self._monitoring_atom_dict[c]
        
        if self.achiever_helper.isAchiever(a, phi):
            r_phi_a = regression(phi, a).simplify()
            new_P.append(Or([Not(r_phi_a), seen_psi]).simplify())
        if self.achiever_helper.isAchiever(a, psi):
            r_psi_a = regression(psi, a).simplify()
            self._add_cond_eff(new_E, r_psi_a, seen_psi)


    def _compile_amo(self, a: InstantaneousAction, c: AtMostOnce, new_P: list, new_E: list):
        phi = c.formula
        seen_phi = self._monitoring_atom_dict[c]
        if self.achiever_helper.isAchiever(a, phi):
            r_phi_a = (regression(phi, a)).simplify()
            new_P.append(Or([Not(r_phi_a), Not(seen_phi), phi]).simplify())
            self._add_cond_eff(new_E, r_phi_a, seen_phi)
            
    #@profile
    def _compile_always(self, a: InstantaneousAction, c: Always, new_P: list):
        phi = c.formula
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

        if type(constr) in {Always, Sometime, AtMostOnce}:
            phi_init_value = state_evaluator.evaluate(constr.formula, initial_state)
        
        elif type(constr) in {SometimeBefore, SometimeAfter}:
            phi_init_value = state_evaluator.evaluate(constr.formula1, initial_state)
            psi_init_value = state_evaluator.evaluate(constr.formula2, initial_state)

        else:
            raise Exception("Unsupported constraint: " + str(constr)) 
        
        if type(constr) == Always:
            self._check_itc_violated_in_init(phi_init_value.is_false(), "always")
            return None, phi_init_value
        elif type(constr) == Sometime:
            return HOLD, phi_init_value
        elif type(constr) == AtMostOnce:
            return SEEN_PHI, phi_init_value
        elif type(constr) == SometimeAfter:
            return HOLD, psi_init_value or not phi_init_value
        else:
            assert type(constr) == SometimeBefore
            self._check_itc_violated_in_init(phi_init_value.is_true(), "sometime-before")
            return SEEN_PSI, psi_init_value

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
            if type(c) in {Sometime, Always, AtMostOnce}:
                atoms = env.free_vars_extractor.get(c.formula)
            elif type(c) in {SometimeBefore, SometimeAfter}:
                atoms = env.free_vars_extractor.get(c.formula1) | env.free_vars_extractor.get(c.formula2)
            else:
                raise Exception("Unsupported constraint: " + str(c))
            for atom in atoms:
                conditions_list = var2constraints_dict.setdefault(atom, [])
                conditions_list.append(c)
        return var2constraints_dict
