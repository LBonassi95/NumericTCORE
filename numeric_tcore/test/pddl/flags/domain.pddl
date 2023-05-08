(define (domain flag-domain)
    ;(:requirements :typing :negative-preconditions :fluents)
    (:types agent flag)

    (:predicates
        (planted ?f - flag)
	)
	
    (:functions
        (x-position ?a - agent)
        (y-position ?a - agent)
        (x-flag ?f - flag)
        (y-flag ?f - flag)
    )

    (:action move-up
        :parameters (?a - agent)
        :precondition (and )
        :effect (and (increase (y-position ?a) 1))
    )
    
    (:action move-down
        :parameters (?a - agent)
        :precondition (and )
        :effect (and (decrease (y-position ?a) 1))
    )

    (:action move-left
        :parameters (?a - agent)
        :precondition (and )
        :effect (and (decrease (x-position ?a) 1))
    )

    (:action move-right 
        :parameters (?a - agent)
        :precondition (and )
        :effect (and (increase (x-position ?a) 1)) 
    )

    (:action plant-flag
        :parameters (?a - agent ?f - flag)
        :precondition (and (= (x-position ?a) (x-flag ?f)) (= (y-position ?a) (y-flag ?f)) (not (planted ?f)))
        :effect (and (planted ?f)) 
    )

)
