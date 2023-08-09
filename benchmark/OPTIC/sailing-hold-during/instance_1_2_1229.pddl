

(define (problem instance_1_2_1229)

	(:domain sailing)

	(:objects
		b0  - boat
		p0 p1  - person
	)

  (:init
		(= (x b0) 7)
(= (y b0) 0)


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

(hold-during 0.08 0.09  
						  ( and  (>= (x b0) -20) 
								 (<= (x b0) 20) 
                                 (>= (y b0) -20) 
								 (<= (y b0) 20) 
								 
						)
						)



(hold-during 0.12 0.13  
						  ( and  (>= (x b0) -20) 
								 (<= (x b0) 20) 
                                 (>= (y b0) -20) 
								 (<= (y b0) 20) 
								 
						)
						)
))

)