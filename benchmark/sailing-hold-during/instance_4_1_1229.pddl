

(define (problem instance_4_1_1229)

	(:domain sailing)

	(:objects
		b0 b1 b2 b3  - boat
		p0  - person
	)

  (:init
		(= (x b0) 3)
(= (y b0) 0)
(= (x b1) 7)
(= (y b1) 0)
(= (x b2) -7)
(= (y b2) 0)
(= (x b3) -2)
(= (y b3) 0)


		(= (d p0) -370)


	)

	(:goal
		(and
			(saved p0)

		)
	)


(:constraints (and 

(hold-during 80 90  
						  ( and  (>= (x b0) -20) 
								 (<= (x b0) 20) 
                                 (>= (y b0) -20) 
								 (<= (y b0) 20) 
								 
						)
						)
))

)