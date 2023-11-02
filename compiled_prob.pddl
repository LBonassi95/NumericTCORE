(define (problem compiledproblem-problem)
 (:domain compiledproblem-domain)
 (:objects
 )
 (:init (= (value c0) 0) (= (value c1) 0) (= (max_int) 4) (= (time) 0))
 (:goal (and (<= (+ 1 (value c0)) (value c1))))
)
