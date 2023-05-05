;; Enrico Scala (enricos83@gmail.com) and Miquel Ramirez (miquel.ramirez@gmail.com)
(define (domain sailing)
    (:types boat -object person -object)
    (:predicates 
        (saved ?t -person)
    )
    (:functions
        (x ?b -boat)
        (y ?b -boat)
        (d ?t -person)
    )
    ;; Increment the value in the given counter by one
    (:action gonortheast
         :parameters (?b -boat)
         :precondition (and )
         :effect (and(increase (x ?b) 1.5) (increase (y ?b) 1.5))
    )
    (:action gonorthwest
         :parameters (?b -boat)
         :precondition (and )
         :effect (and(decrease (x ?b) 1.5) (increase (y ?b) 1.5))
    )
    (:action goest
         :parameters (?b -boat)
         :precondition (and )
         :effect (and(increase (x ?b) 3))
    )
    (:action gowest
         :parameters (?b -boat)
         :precondition (and )
         :effect (and(decrease (x ?b) 3))
    )
    (:action gosouthwest
         :parameters(?b -boat)
         :precondition (and )
         :effect (and(increase (x ?b) 2) (decrease (y ?b) 2))
    )
    (:action gosoutheast
         :parameters(?b -boat)
         :precondition (and )
         :effect (and(decrease (x ?b) 2) (decrease (y ?b) 2))
    )
    (:action gosouth
         :parameters(?b -boat)
         :precondition (and )
         :effect (and (decrease (y ?b) 2))
    )
    (:action saveperson
        :parameters(?b -boat ?t -person)
        :precondition ( and  (>= (+ (x ?b) (y ?b)) (d ?t)) 
                             (>= (- (y ?b) (x ?b)) (d ?t)) 
                             (<= (+ (x ?b) (y ?b)) (+ (d ?t) 25)) 
                             (<= (- (y ?b) (x ?b)) (+ (d ?t) 25))
                      )
        :effect (and(saved ?t))
    )

)
