from unified_planning.shortcuts import *
import pytest


def test_regression():
    action = InstantaneousAction("action")
    x = Fluent('x', RealType())
    action.add_effect(x, 10)

    expression = GT(x, 0)

    assert regression(expression, action) == GT(10, 0)

if __name__ == "__main__":
    pytest.main()