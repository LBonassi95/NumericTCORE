

(define (problem instance_1_1_1229)

	(:domain sailing)

	(:objects
		b0  - boat
		p0  - person
	)

  (:init
		(= (x b0) 3)
(= (y b0) 0)


		(= (d p0) -370)


	)

	(:goal
		(and
			(saved p0)

		)
	)


(:constraints (and 

(hold-during 0.08 0.09  
						  ( and  (>= (x b0) -20) 
								 (<= (x b0) 20) 
                                 (>= (y b0) -20) 
								 (<= (y b0) 20) 
								 
						)
						)
))

)