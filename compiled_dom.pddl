(define (domain compiledproblem-domain)
 (:types counter)
 (:constants
   c1 c0 - counter
 )
 (:predicates (seen_psi_0))
 (:functions (value ?c - counter) (max_int) (time))
 (:action increment_c0
  :parameters ()
  :precondition (and (<= (+ 1 (value c0)) 4))
  :effect (and (increase (value c0) 1) (increase (time) 1) (when (= (+ 1 (value c0)) (max_int)) (seen_psi_0))))
 (:action increment_c1
  :parameters ()
  :precondition (and (<= (+ 1 (value c1)) 4) (or (not (< 0 (+ 1 (value c1)))) (seen_psi_0)))
  :effect (and (increase (value c1) 1) (increase (time) 1)))
 (:action decrement_c0
  :parameters ()
  :precondition (and (<= 1 (value c0)))
  :effect (and (decrease (value c0) 1) (increase (time) 1) (when (= (- (value c0) 1) (max_int)) (seen_psi_0))))
 (:action decrement_c1
  :parameters ()
  :precondition (and (<= 1 (value c1)))
  :effect (and (decrease (value c1) 1) (increase (time) 1)))
)
