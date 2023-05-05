

(define (problem instance_4_500_1229_ladder)
	(:domain farmland)
	(:objects
		farm0 farm1 farm2 farm3  - farm
	)
  (:init
		(= (x farm0) 500)
		(= (x farm1) 1)
		(= (x farm2) 0)
		(= (x farm3) 0)
		
		(adj farm0 farm1)
		(adj farm0 farm2)
		(adj farm1 farm0)
		(adj farm1 farm3)
		(adj farm2 farm0)
		(adj farm2 farm3)
		(adj farm3 farm1)
		(adj farm3 farm2)
		
		(= (cost) 0)
	)
	(:goal
		(and
			(>= (x farm0) 1)
			(>= (x farm1) 1)
			(>= (x farm2) 1)
			(>= (x farm3) 1)
			
			(>= (+ (* 1.0 (x farm0))(+ (* 1.7 (x farm1))(+ (* 1.3 (x farm2))(+ (* 1.1 (x farm3)) 0)))) 700.0)
		)
	)


(:constraints (and (sometime (>= (x farm1) 125))
(sometime (>= (x farm2) 125))
(sometime (>= (x farm3) 125))
(always (>= (+ (x farm0) (+ (x farm1) (+ (x farm2) (x farm3)))) (* 501.0 0.9)))))

)