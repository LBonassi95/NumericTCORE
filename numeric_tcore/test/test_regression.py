from unified_planning.shortcuts import *
from numeric_tcore.numeric_regression import regression
import pytest

x = Fluent('x', RealType())
y = Fluent('y', RealType())
z = Fluent('z', RealType())
a = Fluent('a', RealType())
b = Fluent('b', RealType())

alpha = Fluent('alpha', BoolType())
beta = Fluent('beta', BoolType())
gamma = Fluent('gamma', BoolType())
delta = Fluent('delta', BoolType())

combinations = [([x, 0], [10, 0]),
                ([y, 0], [20, 0]),
                ([z, 5], [Plus(z, 30), 5]),
                ([a, -4], [Minus(x, 15), -4]),
                ([b, 0], [Times(a, Plus(b, 300)), 0]),
                ([Plus(a, b), 0], [Plus(Minus(x, 15), Times(a, Plus(b, 300))), 0]),
                ([Minus(a, b), 0], [Minus(Minus(x, 15), Times(a, Plus(b, 300))), 0]),
                ([Times(a, b), 0], [Times(Minus(x, 15), Times(a, Plus(b, 300))), 0]),
                ([Div(a, b), 0], [Div(Minus(x, 15), Times(a, Plus(b, 300))), 0])]

@pytest.mark.parametrize('values, expected', combinations)
@pytest.mark.parametrize("operator", [Equals, LT, LE, GT, GE])
def test_numeric_expressions(operator, values, expected):
    action = InstantaneousAction("action")

    # INTERESTING: the following regressions shoud return FALSE OR TRUE since the effects are assignments    
    action.add_effect(x, 10)
    action.add_effect(y, 20)
    #####################################################################################################
    action.add_effect(fluent=z, value=Plus(z, 30))
    action.add_effect(fluent=a, value=Minus(x, 15))
    action.add_effect(fluent=b, value=Times(a, Plus(b, 300)))
    assert regression(operator(*values), action) == operator(*expected)


def test_boolean_expressions():
    action = InstantaneousAction("action")

    action.add_effect(fluent=alpha, value=True)
    action.add_effect(fluent=delta, value=True, condition=Or(alpha, beta))
    action.add_effect(fluent=delta, value=False, condition=And(gamma, alpha))
    action.add_effect(fluent=delta, value=False, condition=And(delta, beta))
    assert regression(FluentExp(alpha), action).simplify() == TRUE()
    assert regression(And([alpha, gamma]), action).simplify() == FluentExp(gamma)
    assert regression(And([alpha, delta]), action).simplify() == Or(Or(alpha, beta), And(delta, Not(Or(And(gamma, alpha), And(delta, beta))))).simplify()


def test_mixed_expressions():
    action = InstantaneousAction("action")

    action.add_effect(fluent=x, value=Plus(x, 30))
    action.add_effect(fluent=y, value=Minus(x, 15))
    action.add_effect(fluent=z, value=Times(a, Plus(b, 300)))

    action.add_effect(fluent=alpha, value=False)
    action.add_effect(fluent=delta, value=True, condition=Or(alpha, beta))
    action.add_effect(fluent=delta, value=False, condition=And(gamma, alpha))
    action.add_effect(fluent=delta, value=False, condition=And(delta, beta))

    action.add_effect(fluent=gamma, value=False, condition=GT(Times(a, Plus(b, 10)), -4))
    action.add_effect(fluent=gamma, value=False, condition=Equals(x, 0))
    action.add_effect(fluent=gamma, value=True, condition=LE(Minus(x, 15), 10))

    assert regression(Or(alpha, beta, LT(x, 10)), action).simplify() == Or(beta, LT(Plus(x, 30), 10))
    assert regression(Or(delta, GE(z, 10)), action).simplify() == Or(Or(Or(alpha, beta), And(delta, Not(Or(And(gamma, alpha), And(delta, beta))))), GE(Times(a, Plus(b, 300)), 10)).simplify()

    assert regression(FluentExp(gamma), action) == Or(LE(Minus(x, 15), 10), And(gamma, Not(Or(GT(Times(a, Plus(b, 10)), -4), Equals(x, 0)))))


def test_increase_decrease_effects():
    action = InstantaneousAction("action")

    action.add_increase_effect(fluent=x, value=1)
    action.add_decrease_effect(fluent=y, value=14)
    assert regression(LT(x, 5), action) == LT(Plus(x, 1), 5)
    assert regression(GE(y, 5), action) == GE(Minus(y, 14), 5)

if __name__ == "__main__":
    pytest.main()