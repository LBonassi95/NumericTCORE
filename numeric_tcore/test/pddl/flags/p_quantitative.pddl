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
		(within 5 (= (x-position a1) 3))
        (hold-after 5 (= (x-position a1) 4))
        (hold-during 10 15 (= (x-position a1) 5))
        (always-within 10 (= (x-position a1) 5) (planted f1))
        (always-within 5 (= (x-position a1) 0) (= (x-position a1) 5))
	))
)
