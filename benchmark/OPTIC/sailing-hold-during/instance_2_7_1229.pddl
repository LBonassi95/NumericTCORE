

(define (problem instance_2_7_1229)

	(:domain sailing)

	(:objects
		b0 b1  - boat
		p0 p1 p2 p3 p4 p5 p6  - person
	)

  (:init
		(= (x b0) -2)
(= (y b0) 0)
(= (x b1) 0)
(= (y b1) 0)


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



(hold-during 0.2 0.21  
						  ( and  (>= (x b0) -20) 
								 (<= (x b0) 20) 
                                 (>= (y b0) -20) 
								 (<= (y b0) 20) 
								 
						)
						)



(hold-during 0.26 0.27  
						  ( and  (>= (x b1) -20) 
								 (<= (x b1) 20) 
                                 (>= (y b1) -20) 
								 (<= (y b1) 20) 
								 
						)
						)



(hold-during 0.32 0.33  
						  ( and  (>= (x b0) -20) 
								 (<= (x b0) 20) 
                                 (>= (y b0) -20) 
								 (<= (y b0) 20) 
								 
						)
						)



(hold-during 0.38 0.39  
						  ( and  (>= (x b1) -20) 
								 (<= (x b1) 20) 
                                 (>= (y b1) -20) 
								 (<= (y b1) 20) 
								 
						)
						)



(hold-during 0.44 0.45  
						  ( and  (>= (x b0) -20) 
								 (<= (x b0) 20) 
                                 (>= (y b0) -20) 
								 (<= (y b0) 20) 
								 
						)
						)
))

)