from unified_planning.shortcuts import FNode

class Sometime:

    def __init__(self, formula: FNode) -> None:
        self.formula = formula

    def __repr__(self) -> str:
        return f"Sometime({self.formula})"
    
class Always:

    def __init__(self, formula: FNode) -> None:
        self.formula = formula

    def __repr__(self) -> str:
        return f"Always({self.formula})"
    

class AtMostOnce:
    
        def __init__(self, formula: FNode) -> None:
            self.formula = formula
    
        def __repr__(self) -> str:
            return f"AtMostOnce({self.formula})"
        

class SometimeBefore:

    def __init__(self, formula1: FNode, formula2: FNode) -> None:
        self.formula1 = formula1
        self.formula2 = formula2

    def __repr__(self) -> str:
        return f"SometimeBefore({self.formula1}, {self.formula2})"


class SometimeAfter:
    
    def __init__(self, formula1: FNode, formula2: FNode) -> None:
        self.formula1 = formula1
        self.formula2 = formula2

    def __repr__(self) -> str:
        return f"SometimeAfter({self.formula1}, {self.formula2})"

class AtEnd:

    def __init__(self, formula: FNode) -> None:
        self.formula = formula

    def __repr__(self) -> str:
        return f"AtEnd({self.formula})"

class Within:

    def __init__(self, t: int, formula: FNode) -> None:
        self.t = t
        self.formula = formula

    def __repr__(self) -> str:
        return f"Within({self.t}, {self.formula})"
    
    
class HoldAfter:

    def __init__(self, t: int, formula: FNode) -> None:
        self.t = t
        self.formula = formula

    def __repr__(self) -> str:
        return f"HoldAfter({self.t}, {self.formula})"
    

class HoldDuring:

    def __init__(self, u1: int, u2: int, formula: FNode) -> None:
        self.u1 = u1
        self.u2 = u2
        self.formula = formula

    def __repr__(self) -> str:
        return f"HoldDuring({self.u1}, {self.u2}, {self.formula})"

class AlwaysWithin:

    def __init__(self, t: int, formula1: FNode, formula2: FNode) -> None:
        self.t = t
        self.formula1 = formula1
        self.formula2 = formula2

    def __repr__(self) -> str:
        return f"AlwaysWithin({self.t}, {self.formula1}, {self.formula2})"

    def __hash__(self) -> int:
        return hash((self.__class__, self.t, self.formula1, self.formula2))