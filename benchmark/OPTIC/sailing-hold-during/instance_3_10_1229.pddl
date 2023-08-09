

(define (problem instance_3_10_1229)

	(:domain sailing)

	(:objects
		b0 b1 b2  - boat
		p0 p1 p2 p3 p4 p5 p6 p7 p8 p9  - person
	)

  (:init
		(= (x b0) -5)
(= (y b0) 0)
(= (x b1) 1)
(= (y b1) 0)
(= (x b2) -7)
(= (y b2) 0)


		(= (d p0) -370)
(= (d p1) -58)
(= (d p2) 63)
(= (d p3) 483)
(= (d p4) 223)
(= (d p5) 316)
(= (d p6) -394)
(= (d p7) -242)
(= (d p8) -160)
(= (d p9) -338)


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
(saved p7)
(saved p8)
(saved p9)

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



(hold-during 0.24 0.25  
						  ( and  (>= (x b2) -20) 
								 (<= (x b2) 20) 
                                 (>= (y b2) -20) 
								 (<= (y b2) 20) 
								 
						)
						)



(hold-during 0.32 0.33  
						  ( and  (>= (x b0) -20) 
								 (<= (x b0) 20) 
                                 (>= (y b0) -20) 
								 (<= (y b0) 20) 
								 
						)
						)



(hold-during 0.4 0.41000000000000003  
						  ( and  (>= (x b1) -20) 
								 (<= (x b1) 20) 
                                 (>= (y b1) -20) 
								 (<= (y b1) 20) 
								 
						)
						)



(hold-during 0.48 0.49  
						  ( and  (>= (x b2) -20) 
								 (<= (x b2) 20) 
                                 (>= (y b2) -20) 
								 (<= (y b2) 20) 
								 
						)
						)



(hold-during 0.56 0.5700000000000001  
						  ( and  (>= (x b0) -20) 
								 (<= (x b0) 20) 
                                 (>= (y b0) -20) 
								 (<= (y b0) 20) 
								 
						)
						)



(hold-during 0.64 0.65  
						  ( and  (>= (x b1) -20) 
								 (<= (x b1) 20) 
                                 (>= (y b1) -20) 
								 (<= (y b1) 20) 
								 
						)
						)



(hold-during 0.72 0.73  
						  ( and  (>= (x b2) -20) 
								 (<= (x b2) 20) 
                                 (>= (y b2) -20) 
								 (<= (y b2) 20) 
								 
						)
						)



(hold-during 0.8 0.81  
						  ( and  (>= (x b0) -20) 
								 (<= (x b0) 20) 
                                 (>= (y b0) -20) 
								 (<= (y b0) 20) 
								 
						)
						)
))

)