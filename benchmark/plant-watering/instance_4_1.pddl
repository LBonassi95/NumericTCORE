
(define (problem instance_4_1)
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
	(= (x agent1) 3)
	(= (y agent1) 1)
	(= (x plant2) 2)
	(= (y plant2) 2)
	(= (x plant3) 1)
	(= (y plant3) 1)
	(= (x tap1) 3)
	(= (y tap1) 3)
	(= (x plant4) 1)
	(= (y plant4) 1)
	(= (x plant1) 2)
	(= (y plant1) 2)
  )

  (:goal (and 
    (= (poured plant1) 4)
	(= (poured plant2) 2)
	(= (poured plant3) 7)
	(= (poured plant4) 9)
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