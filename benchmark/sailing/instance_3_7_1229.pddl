

(define (problem instance_3_7_1229)

	(:domain sailing)

	(:objects
		b0 b1 b2  - boat
		p0 p1 p2 p3 p4 p5 p6  - person
	)

  (:init
		(= (x b0) -2)
(= (y b0) 0)
(= (x b1) 0)
(= (y b1) 0)
(= (x b2) -5)
(= (y b2) 0)


		(= (d p0) -370)
(= (d p1) -58)
(= (d p2) 63)
(= (d p3) 483)
(= (d p4) 223)
(= (d p5) 316)
(= (d p6) -394)


	)

	(:goal
		(and
			(saved p0)
(saved p1)
(saved p2)
(saved p3)
(saved p4)
(saved p5)
(saved p6)

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