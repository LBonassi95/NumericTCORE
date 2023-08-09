

(define (problem instance_3_2_1229)

	(:domain sailing)

	(:objects
		b0 b1 b2  - boat
		p0 p1  - person
	)

  (:init
		(= (x b0) 7)
(= (y b0) 0)
(= (x b1) -7)
(= (y b1) 0)
(= (x b2) -2)
(= (y b2) 0)


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



(hold-during 0.16 0.17  
						  ( and  (>= (x b1) -20) 
								 (<= (x b1) 20) 
                                 (>= (y b1) -20) 
								 (<= (y b1) 20) 
								 
						)
						)
))

)