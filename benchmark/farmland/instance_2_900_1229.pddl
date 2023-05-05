

(define (problem instance_2_900_1229_ladder)
	(:domain farmland)
	(:objects
		farm0 farm1  - farm
	)
  (:init
		(= (x farm0) 900)
		(= (x farm1) 1)
		
		(adj farm0 farm1)
		(adj farm1 farm0)
		
		(= (cost) 0)
	)
	(:goal
		(and
			(>= (x farm0) 1)
			(>= (x farm1) 1)
			
			(>= (+ (* 1.0 (x farm0))(+ (* 1.7 (x farm1)) 0)) 1260.0)
		)
	)


(:constraints (and (sometime (>= (x farm1) 225))
(always (>= (+ (x farm0) (x farm1)) (* 901.0 0.9)))))

)