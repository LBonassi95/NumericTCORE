

(define (problem instance_2_400_1229_ladder)
	(:domain farmland)
	(:objects
		farm0 farm1  - farm
	)
  (:init
		(= (x farm0) 400)
		(= (x farm1) 1)
		
		(adj farm0 farm1)
		(adj farm1 farm0)
		
		(= (cost) 0)
	)
	(:goal
		(and
			(>= (x farm0) 1)
			(>= (x farm1) 1)
			
			(>= (+ (* 1.0 (x farm0))(+ (* 1.7 (x farm1)) 0)) 560.0)
		)
	)


(:constraints (and (sometime (>= (x farm1) 100))
(always (>= (+ (x farm0) (x farm1)) (* 401.0 0.9)))))

)