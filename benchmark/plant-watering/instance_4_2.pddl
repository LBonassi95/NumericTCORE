
(define (problem instance_4_2)
  (:domain mt-plant-watering)
  (:objects
    tap1 - tap
	agent1 - agent
	plant3 plant1 plant4 plant2 - plant
  )

  (:init
    (= (max_int) 80)
	(= (maxx) 4)
	(= (minx) 1)
	(= (maxy) 4)
	(= (miny) 1)
	(= (carrying) 0)
	(= (total_poured) 0)
	(= (total_loaded) 0)
	(= (poured plant1) 0)
	(= (poured plant2) 0)
	(= (poured plant3) 0)
	(= (poured plant4) 0)
	(= (x agent1) 4)
	(= (y agent1) 1)
	(= (x plant2) 1)
	(= (y plant2) 1)
	(= (x plant3) 1)
	(= (y plant3) 1)
	(= (x tap1) 3)
	(= (y tap1) 3)
	(= (x plant4) 4)
	(= (y plant4) 4)
	(= (x plant1) 3)
	(= (y plant1) 3)
  )

  (:goal (and 
    (= (poured plant1) 10)
	(= (poured plant2) 3)
	(= (poured plant3) 4)
	(= (poured plant4) 6)
	(= (total_poured) (+ (+ (+ (poured plant1) (poured plant2)) (poured plant3)) (poured plant4)) )
  ))

  
  

  


(:constraints (and 
    (always 
		
		(forall (?p1 - plant ?p2 - plant ?p3 - plant) 
			(imply (and (not (= ?p1 ?p2)) (not (= ?p1 ?p3)) (not (= ?p2 ?p3))) (<= (carrying) (+ (poured ?p1) (+ (poured ?p2) (+ (poured ?p3) 1)))))
			
		)
	)
    ))

)