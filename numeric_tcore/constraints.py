from unified_planning.shortcuts import FNode


class Constraint:

    def __init__(self) -> None:
        pass

    def __eq__(self, other: object) -> bool:
        return (self.hash == other.hash) if isinstance(other, self.__class__) else False
    
    def __hash__(self) -> int:
        raise NotImplementedError

    def __repr__(self) -> str:
        raise NotImplementedError


class UnaryConstraint(Constraint):
    
        def __init__(self, phi: FNode) -> None:
            self.phi = phi
            self.hash = hash((self.__class__, self.phi))
    
        def __hash__(self) -> int:
            return self.hash
        

class BinaryConstraint(Constraint):
    
        def __init__(self, phi: FNode, psi: FNode) -> None:
            self.phi = phi
            self.psi = psi
            self.hash = hash((self.__class__, self.phi, self.psi))
    
        def __hash__(self) -> int:
            return self.hash
        

class Sometime(UnaryConstraint):

    def __init__(self, phi: FNode) -> None:
        super().__init__(phi)

    def __repr__(self) -> str:
        return f"Sometime({self.phi})"
    

class Always(UnaryConstraint):

    def __init__(self, phi: FNode) -> None:
        super().__init__(phi)

    def __repr__(self) -> str:
        return f"Always({self.phi})"
    

class AtMostOnce(UnaryConstraint):
    
        def __init__(self, phi: FNode) -> None:
            super().__init__(phi)
    
        def __repr__(self) -> str:
            return f"AtMostOnce({self.phi})"
        

class AtEnd(UnaryConstraint):

    def __init__(self, phi: FNode) -> None:
        super().__init__(phi)

    def __repr__(self) -> str:
        return f"AtEnd({self.phi})"


class SometimeBefore(BinaryConstraint):

    def __init__(self, phi: FNode, psi: FNode) -> None:
        super().__init__(phi, psi)

    def __repr__(self) -> str:
        return f"SometimeBefore({self.phi}, {self.psi})"


class SometimeAfter(BinaryConstraint):

    def __init__(self, phi: FNode, psi: FNode) -> None:
        super().__init__(phi, psi)

    def __repr__(self) -> str:
        return f"SometimeAfter({self.phi}, {self.psi})"


class Within(UnaryConstraint):

    def __init__(self, t: int, phi: FNode) -> None:
        super().__init__(phi)
        self.t = t
        self.hash = hash((self.__class__, self.t, self.phi))

    def __repr__(self) -> str:
        return f"Within({self.t}, {self.phi})"
    
    
class HoldAfter(UnaryConstraint):

    def __init__(self, t: int, phi: FNode) -> None:
        super().__init__(phi)
        self.t = t
        self.hash = hash((self.__class__, self.t, self.phi))

    def __repr__(self) -> str:
        return f"HoldAfter({self.t}, {self.phi})"
    

class HoldDuring(UnaryConstraint):

    def __init__(self, u1: int, u2: int, phi: FNode) -> None:
        super().__init__(phi)
        self.u1 = u1
        self.u2 = u2
        self.hash = hash((self.__class__, self.u1, self.u2, self.phi))

    def __repr__(self) -> str:
        return f"HoldDuring({self.u1}, {self.u2}, {self.phi})"


class AlwaysWithin(BinaryConstraint):

    def __init__(self, t: int, phi: FNode, psi: FNode) -> None:
        super().__init__(phi, psi)
        self.t = t
        self.hash = hash((self.__class__, self.t, self.phi, self.psi))

    def __repr__(self) -> str:
        return f"AlwaysWithin({self.t}, {self.phi}, {self.psi})"