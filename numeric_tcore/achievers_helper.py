from numeric_tcore.numeric_regression import regression, gamma
from unified_planning.model.fnode import FNode
from unified_planning.shortcuts import *
from unified_planning.model.walkers import LinearChecker, FreeVarsExtractor, Substituter, Simplifier, Nnf
from sympy.parsing.sympy_parser import parse_expr, standard_transformations
from unified_planning.environment import get_environment


NAIVE = "naive"
REGRESSION = "regression"
DELTA = "delta"
STRATEGIES = [NAIVE, REGRESSION, DELTA]
NNF_ERROR = "Error! The formula '{}' is not in NNF"

class AchieverHelper:
    
    def __init__(self, strategy, problem = None) -> None:
        assert strategy in STRATEGIES
        self.strategy = strategy
        self.substituter = Substituter(get_environment())
        self.extractor = FreeVarsExtractor()
        self.linear_checker = LinearChecker()
        self.nnf_transformer = Nnf(get_environment())
        self.sympy_cache = {}
        self.problem = problem
        if self.problem is not None:
            self.simplifier = Simplifier(get_environment(), self.problem)


    #@profile
    def isAchiever(self, action, phi):
        
        if self.strategy == NAIVE:
            return True
        
        elif self.strategy == REGRESSION:
            return phi != regression(phi, action)

        elif self.strategy == DELTA:

            #if phi != regression(phi, action):

            phi = self.nnf_transformer.get_nnf_expression(phi)
            conditions = self._get_conditions(phi)

            for condition in conditions:
                if condition.is_fluent_exp() or (condition.is_not() and condition.args[0].is_fluent_exp()):
                    if self.deltaAchieverBoolean(condition, action):
                        return True
                else:
                    if self.deltaAchieverStrategy(condition, action):
                        return True

            return False
            # else:
            #     return False
    
    def _get_conditions(self, phi: FNode):
        if phi.is_and() or phi.is_or():
            conditions = []
            for c in phi.args:
                conditions += self._get_conditions(c)
            return conditions
        elif phi.is_not():
             if not (phi.args[0].is_le() or phi.args[0].is_lt() or phi.args[0].is_equals() or phi.args[0].is_fluent_exp()):
                raise Exception(NNF_ERROR.format(phi))
             else:
                 return [phi]
        else:
            assert phi.is_le() or phi.is_lt() or phi.is_equals() or phi.is_fluent_exp()
            return [phi]

    def _get_negated_condition(self, expression: FNode):
        expr = expression.args[0]
        if expr.is_le():
            return GT(expr.args[0], expr.args[1])
        elif expr.is_lt():
            return GE(expr.args[0], expr.args[1])
        elif expr.is_equals():
            return expr
        else:
            raise Exception(NNF_ERROR.format(expression))
        

    def deltaAchieverBoolean(self, expression: FNode, action):
        res = gamma(expression, action)
        if res == False:
            return False
        else:
            return True

    #@profile
    def deltaAchieverStrategy(self, expression: FNode, action):

        # if not self._constant_numeric_influence(action, expression):
        #     return True

        assert expression.is_le() or expression.is_lt() or expression.is_not() or expression.is_equals()

        equality = False
        if expression.is_equals():
            equality = True
        
        if expression.is_not():
            if expression.args[0].is_equals():
                equality = True
            expression = self._get_negated_condition(expression)

        
        regressed_expression = regression(expression, action)

        if self.problem is not None:
            expression = self.simplifier.simplify(expression)
            regressed_expression = self.simplifier.simplify(regressed_expression)

        if regressed_expression == FALSE() or regressed_expression == TRUE() or expression == FALSE() or expression == TRUE(): 
            return True

        fluents = self.extractor.get(expression) | self.extractor.get(regressed_expression)
        new_vars_dict = self._get_substitutions(fluents)

        new_expression = self.substituter.substitute(expression, new_vars_dict)
        regressed_expression = self.substituter.substitute(regressed_expression, new_vars_dict)
        # regressed_expression = self.substituter.substitute(regressed_expression, new_vars_dict)

        if regressed_expression == new_expression:
            # We do this check just to speed up the process
            return False

        delta = self._get_delta(new_expression, regressed_expression)
        if not delta.is_Number:
            return True
        
        if delta == 0:
            return False
        
        else:
            if equality == True:
                return True
            elif delta < 0:
                return False
            else:
                return True

    #@profile
    def _get_delta(self, expr: FNode, regressed_expr: FNode):

        if self.sympy_cache.get(expr) is not None:
            sympy_expr = self.sympy_cache[expr]
        else:
            if expr.is_equals():
                # This is just for compatibility with sympy
                sympy_expr = parse_expr(str(expr).replace('==', '<='), transformations=standard_transformations)
            else:
                sympy_expr = parse_expr(str(expr), transformations=standard_transformations)
            self.sympy_cache[expr] = sympy_expr
        
        if self.sympy_cache.get(regressed_expr) is not None:
            sympy_regressed_expr = self.sympy_cache[regressed_expr]
        else:
            if regressed_expr.is_equals():
                # This is just for compatibility with sympy
                sympy_regressed_expr = parse_expr(str(regressed_expr).replace('==', '<='), transformations=standard_transformations)
            else:
                sympy_regressed_expr = parse_expr(str(regressed_expr), transformations=standard_transformations)
            self.sympy_cache[regressed_expr] = sympy_regressed_expr

        # If we have lhs <= rhs, we want to get 0 <= rhs - lhs
        normalized_expression = sympy_expr.rhs - sympy_expr.lhs
        normalized_regressed_expression = sympy_regressed_expr.rhs - sympy_regressed_expr.lhs

        delta = normalized_regressed_expression - normalized_expression
        return delta 
    
    def _get_substitutions(self, fluents):
        '''
        Before converting an expression to a sympy expression, we need to substitute all the
        fluents with new variables var0, var1 ecc...
        This is because sympy interprets fluent(a, b) as a function, not as a variable.
        '''
        new_vars_dict = {}
        index = 0
        for fluent in fluents:
            new_fl = Fluent(f'var{index}', RealType())
            new_vars_dict[fluent] = FluentExp(new_fl)
            index += 1
        return new_vars_dict

    # def _constant_numeric_influence(self, action: InstantaneousAction, expression: FNode):

    #     isLinear, _, _ = self.linear_checker.get_fluents(expression)

    #     if not isLinear:
    #         # If the formula is not linear, then we consider "action" an achiever
    #         return False

    #     expression_variables = self.extractor.get(expression)

    #     for effect in action.effects:
            
    #         # We only check the assignments that affect variables in the expression
    #         if effect.is_assignment() and effect.fluent in expression_variables:
    #             value = effect.value
    #             isLinear, _, _ = self.linear_checker.get_fluents(value)
    #             if not isLinear:
    #                 return False
    #             # Value is linear. We have to check if it can be rewritten as a constant increase or decrease.
    #             # Example y = 2x + 3 NO!
    #             # Example y = 2y + 3 + 5 YES!
    #             # Example y = x + 3 NO!
    #             value_variables = self.extractor.get(value)
    #             if value_variables != {effect.fluent}: 
    #                 return False

    #             value_for_sympy, var_dict = self._preprocess_expression(value)
    #             fluent_for_sympy = var_dict[effect.fluent]
    #             sympy_value = parse_expr(str(value_for_sympy), transformations=standard_transformations)

    #             coefficient = sympy_value.coeff(fluent_for_sympy)
    #             if coefficient != 1 and coefficient != -1:
    #                 return False
                
    #     return True