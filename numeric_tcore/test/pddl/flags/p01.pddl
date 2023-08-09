(define
    (problem flag1)
    (:domain flag-domain)
    (:objects
        a1 - agent
        f1 - flag
        f2 - flag
    )
    (:init
        (= (x-position a1) 0)
        (= (y-position a1) 0)
        (= (x-flag f1) 1)
        (= (y-flag f1) 1)
        (= (x-flag f2) -1)
        (= (y-flag f2) -1)
    )
    (:goal (and
            (planted f1)
            (planted f2)
        )
    )
	(:constraints (and
		(at-most-once (> (y-position a1) 5))
	))
)
