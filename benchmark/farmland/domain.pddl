 
(define (domain farmland)
    (:types farm -object)
    (:predicates (adj ?f1 ?f2 -farm))
    (:functions
        (x ?b -farm)
        (cost)
    )

    ;; Move a person from a unit f1 to a unit f2
    (:action movefast
        :parameters (?f1 ?f2 -farm)
       :precondition (and (not (= ?f1 ?f2)) (>= (x ?f1) 4) (adj ?f1 ?f2) )
      :effect (and(decrease (x ?f1) 4) (increase (x ?f2) 2) (increase (cost) 1))
    )
    
    (:action moveslow
         :parameters (?f1 ?f2 -farm)
         :precondition (and (not (= ?f1 ?f2)) (>= (x ?f1) 1) (adj ?f1 ?f2))
         :effect (and(decrease (x ?f1) 1) (increase (x ?f2) 1))
    )

)
