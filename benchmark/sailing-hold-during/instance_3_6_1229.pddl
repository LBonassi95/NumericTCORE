

(define (problem instance_3_6_1229)

	(:domain sailing)

	(:objects
		b0 b1 b2  - boat
		p0 p1 p2 p3 p4 p5  - person
	)

  (:init
		(= (x b0) -7)
(= (y b0) 0)
(= (x b1) -2)
(= (y b1) 0)
(= (x b2) 0)
(= (y b2) 0)


		(= (d p0) -370)
(= (d p1) -58)
(= (d p2) 63)
(= (d p3) 483)
(= (d p4) 223)
(= (d p5) 316)


	)

	(:goal
		(and
			(saved p0)
(saved p1)
(saved p2)
(saved p3)
(saved p4)
(saved p5)

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



(hold-during 160 170  
						  ( and  (>= (x b1) -20) 
								 (<= (x b1) 20) 
                                 (>= (y b1) -20) 
								 (<= (y b1) 20) 
								 
						)
						)



(hold-during 240 250  
						  ( and  (>= (x b2) -20) 
								 (<= (x b2) 20) 
                                 (>= (y b2) -20) 
								 (<= (y b2) 20) 
								 
						)
						)



(hold-during 320 330  
						  ( and  (>= (x b0) -20) 
								 (<= (x b0) 20) 
                                 (>= (y b0) -20) 
								 (<= (y b0) 20) 
								 
						)
						)



(hold-during 400 410  
						  ( and  (>= (x b1) -20) 
								 (<= (x b1) 20) 
                                 (>= (y b1) -20) 
								 (<= (y b1) 20) 
								 
						)
						)



(hold-during 480 490  
						  ( and  (>= (x b2) -20) 
								 (<= (x b2) 20) 
                                 (>= (y b2) -20) 
								 (<= (y b2) 20) 
								 
						)
						)
))

)