from unified_planning.shortcuts import *
from unified_planning.model.fnode import FNode


def regression(expression: FNode, action: InstantaneousAction) -> FNode:
    if expression.is_equals():
        return Equals(regression(expression.args[0], action), regression(expression.args[1], action))