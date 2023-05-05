

(define (problem instance_10_700_1229_ladder)
	(:domain farmland)
	(:objects
		farm0 farm1 farm2 farm3 farm4 farm5 farm6 farm7 farm8 farm9  - farm
	)
  (:init
		(= (x farm0) 1)
		(= (x farm1) 700)
		(= (x farm2) 0)
		(= (x farm3) 0)
		(= (x farm4) 0)
		(= (x farm5) 1)
		(= (x farm6) 1)
		(= (x farm7) 0)
		(= (x farm8) 0)
		(= (x farm9) 0)
		
		(adj farm0 farm1)
		(adj farm0 farm5)
		(adj farm1 farm0)
		(adj farm1 farm2)
		(adj farm1 farm6)
		(adj farm2 farm1)
		(adj farm2 farm3)
		(adj farm2 farm7)
		(adj farm3 farm8)
		(adj farm3 farm2)
		(adj farm3 farm4)
		(adj farm4 farm9)
		(adj farm4 farm3)
		(adj farm5 farm0)
		(adj farm5 farm6)
		(adj farm6 farm1)
		(adj farm6 farm5)
		(adj farm6 farm7)
		(adj farm7 farm8)
		(adj farm7 farm2)
		(adj farm7 farm6)
		(adj farm8 farm9)
		(adj farm8 farm3)
		(adj farm8 farm7)
		(adj farm9 farm8)
		(adj farm9 farm4)
		
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
			(>= (x farm8) 1)
			(>= (x farm9) 1)
			
			(>= (+ (* 1.7 (x farm0))(+ (* 1.0 (x farm1))(+ (* 1.3 (x farm2))(+ (* 1.1 (x farm3))(+ (* 1.4 (x farm4))(+ (* 1.9 (x farm5))(+ (* 1.3 (x farm6))(+ (* 1.4 (x farm7))(+ (* 1.4 (x farm8))(+ (* 1.1 (x farm9)) 0)))))))))) 980.0)
		)
	)


(:constraints (and (sometime (>= (x farm0) 175))
(sometime (>= (x farm2) 175))
(sometime (>= (x farm3) 175))
(sometime (>= (x farm4) 175))
(sometime (>= (x farm5) 175))
(sometime (>= (x farm6) 175))
(sometime (>= (x farm7) 175))
(sometime (>= (x farm8) 175))
(sometime (>= (x farm9) 175))
(always (>= (+ (x farm0) (+ (x farm1) (+ (x farm2) (+ (x farm3) (+ (x farm4) (+ (x farm5) (+ (x farm6) (+ (x farm7) (+ (x farm8) (x farm9)))))))))) (* 703.0 0.9)))))

)