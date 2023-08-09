

(define (problem instance_4_5_1229)

	(:domain sailing)

	(:objects
		b0 b1 b2 b3  - boat
		p0 p1 p2 p3 p4  - person
	)

  (:init
		(= (x b0) -7)
(= (y b0) 0)
(= (x b1) -2)
(= (y b1) 0)
(= (x b2) 0)
(= (y b2) 0)
(= (x b3) -5)
(= (y b3) 0)


		(= (d p0) -370)
(= (d p1) -58)
(= (d p2) 63)
(= (d p3) 483)
(= (d p4) 223)


	)

	(:goal
		(and
			(saved p0)
(saved p1)
(saved p2)
(saved p3)
(saved p4)

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



(hold-during 0.18 0.19  
						  ( and  (>= (x b1) -20) 
								 (<= (x b1) 20) 
                                 (>= (y b1) -20) 
								 (<= (y b1) 20) 
								 
						)
						)



(hold-during 0.28 0.29  
						  ( and  (>= (x b2) -20) 
								 (<= (x b2) 20) 
                                 (>= (y b2) -20) 
								 (<= (y b2) 20) 
								 
						)
						)



(hold-during 0.38 0.39  
						  ( and  (>= (x b3) -20) 
								 (<= (x b3) 20) 
                                 (>= (y b3) -20) 
								 (<= (y b3) 20) 
								 
						)
						)



(hold-during 0.48 0.49  
						  ( and  (>= (x b0) -20) 
								 (<= (x b0) 20) 
                                 (>= (y b0) -20) 
								 (<= (y b0) 20) 
								 
						)
						)
))

)