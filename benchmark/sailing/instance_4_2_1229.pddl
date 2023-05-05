

(define (problem instance_4_2_1229)

	(:domain sailing)

	(:objects
		b0 b1 b2 b3  - boat
		p0 p1  - person
	)

  (:init
		(= (x b0) 7)
(= (y b0) 0)
(= (x b1) -7)
(= (y b1) 0)
(= (x b2) -2)
(= (y b2) 0)
(= (x b3) 0)
(= (y b3) 0)


		(= (d p0) -370)
(= (d p1) -58)


	)

	(:goal
		(and
			(saved p0)
(saved p1)

		)
	)


(:constraints (and 
    (forall (?b -boat ?t -person) 
			(at-most-once ( and  (>= (+ (x ?b) (y ?b)) (d ?t)) 
								(>= (- (y ?b) (x ?b)) (d ?t)) 
								(<= (+ (x ?b) (y ?b)) (+ (d ?t) 25)) 
								(<= (- (y ?b) (x ?b)) (+ (d ?t) 25))
						)
						))
    ))

)