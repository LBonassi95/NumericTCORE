

(define (problem instance_8_600_1229_ladder)
	(:domain farmland)
	(:objects
		farm0 farm1 farm2 farm3 farm4 farm5 farm6 farm7  - farm
	)
  (:init
		(= (x farm0) 1)
		(= (x farm1) 600)
		(= (x farm2) 0)
		(= (x farm3) 0)
		(= (x farm4) 0)
		(= (x farm5) 1)
		(= (x farm6) 1)
		(= (x farm7) 0)
		
		(adj farm0 farm1)
		(adj farm0 farm4)
		(adj farm1 farm0)
		(adj farm1 farm2)
		(adj farm1 farm5)
		(adj farm2 farm1)
		(adj farm2 farm3)
		(adj farm2 farm6)
		(adj farm3 farm2)
		(adj farm3 farm7)
		(adj farm4 farm0)
		(adj farm4 farm5)
		(adj farm5 farm1)
		(adj farm5 farm4)
		(adj farm5 farm6)
		(adj farm6 farm2)
		(adj farm6 farm5)
		(adj farm6 farm7)
		(adj farm7 farm3)
		(adj farm7 farm6)
		
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
			(>= (x farm6) 1)
			(>= (x farm7) 1)
			
			(>= (+ (* 1.7 (x farm0))(+ (* 1.0 (x farm1))(+ (* 1.3 (x farm2))(+ (* 1.1 (x farm3))(+ (* 1.4 (x farm4))(+ (* 1.9 (x farm5))(+ (* 1.3 (x farm6))(+ (* 1.4 (x farm7)) 0)))))))) 840.0)
		)
	)


(:constraints (and (sometime (>= (x farm0) 150))
(sometime (>= (x farm2) 150))
(sometime (>= (x farm3) 150))
(sometime (>= (x farm4) 150))
(sometime (>= (x farm5) 150))
(sometime (>= (x farm6) 150))
(sometime (>= (x farm7) 150))
(always (>= (+ (x farm0) (+ (x farm1) (+ (x farm2) (+ (x farm3) (+ (x farm4) (+ (x farm5) (+ (x farm6) (x farm7)))))))) (* 603.0 0.9)))))

)