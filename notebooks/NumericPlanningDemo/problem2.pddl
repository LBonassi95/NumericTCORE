(define
    (problem flag1)
    (:domain flag-domain)
    (:objects
        a1 - agent
        a2 - agent
        f1 - flag
        f2 - flag
    )
    (:init
        (= (x-position a1) 0)
        (= (y-position a1) 0)
        (= (x-position a2) 10)
        (= (y-position a2) 10)
        (= (x-flag f1) 1)
        (= (y-flag f1) 1)
        (= (x-flag f2) -2)
        (= (y-flag f2) -2)
    )
    (:goal (and
            (planted f1)
            (planted f2)
        )
    )
	(:constraints (and
        (always (< (x-position a1) 1))
	))
)
