

(define (problem instance_2_2_1229)

	(:domain sailing)

	(:objects
		b0 b1  - boat
		p0 p1  - person
	)

  (:init
		(= (x b0) 7)
(= (y b0) 0)
(= (x b1) -7)
(= (y b1) 0)


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



(hold-during 0.14 0.15  
						  ( and  (>= (x b1) -20) 
								 (<= (x b1) 20) 
                                 (>= (y b1) -20) 
								 (<= (y b1) 20) 
								 
						)
						)
))

)