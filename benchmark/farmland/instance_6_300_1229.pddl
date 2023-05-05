

(define (problem instance_6_300_1229_ladder)
	(:domain farmland)
	(:objects
		farm0 farm1 farm2 farm3 farm4 farm5  - farm
	)
  (:init
		(= (x farm0) 300)
		(= (x farm1) 1)
		(= (x farm2) 0)
		(= (x farm3) 0)
		(= (x farm4) 0)
		(= (x farm5) 1)
		
		(adj farm0 farm1)
		(adj farm0 farm3)
		(adj farm1 farm0)
		(adj farm1 farm2)
		(adj farm1 farm4)
		(adj farm2 farm1)
		(adj farm2 farm5)
		(adj farm3 farm0)
		(adj farm3 farm4)
		(adj farm4 farm1)
		(adj farm4 farm3)
		(adj farm4 farm5)
		(adj farm5 farm2)
		(adj farm5 farm4)
		
		(= (cost) 0)
	)
	(:goal
		(and
			(>= (x farm0) 1)
			(>= (x farm1) 1)
			(>= (x farm2) 1)
			(>= (x farm3) 1)
			(>= (x farm4) 1)
			(>= (x farm5) 1)
			
			(>= (+ (* 1.0 (x farm0))(+ (* 1.7 (x farm1))(+ (* 1.3 (x farm2))(+ (* 1.1 (x farm3))(+ (* 1.4 (x farm4))(+ (* 1.9 (x farm5)) 0)))))) 420.0)
		)
	)


(:constraints (and (sometime (>= (x farm1) 75))
(sometime (>= (x farm2) 75))
(sometime (>= (x farm3) 75))
(sometime (>= (x farm4) 75))
(sometime (>= (x farm5) 75))
(always (>= (+ (x farm0) (+ (x farm1) (+ (x farm2) (+ (x farm3) (+ (x farm4) (x farm5)))))) (* 302.0 0.9)))))

)