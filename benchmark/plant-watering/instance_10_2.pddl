
(define (problem instance_10_2)
  (:domain mt-plant-watering)
  (:objects
    tap1 - tap
	agent1 - agent
	plant10 plant9 plant2 plant3 plant1 plant8 plant6 plant5 plant7 plant4 - plant
  )

  (:init
    (= (max_int) 200)
	(= (maxx) 10)
	(= (minx) 1)
	(= (maxy) 10)
	(= (miny) 1)
	(= (carrying) 0)
	(= (total_poured) 0)
	(= (total_loaded) 0)
	(= (poured plant1) 0)
	(= (poured plant2) 0)
	(= (poured plant3) 0)
	(= (poured plant4) 0)
	(= (poured plant5) 0)
	(= (poured plant6) 0)
	(= (poured plant7) 0)
	(= (poured plant8) 0)
	(= (poured plant9) 0)
	(= (poured plant10) 0)
	(= (x agent1) 3)
	(= (y agent1) 4)
	(= (x plant10) 2)
	(= (y plant10) 2)
	(= (x plant1) 6)
	(= (y plant1) 6)
	(= (x plant3) 4)
	(= (y plant3) 4)
	(= (x plant2) 8)
	(= (y plant2) 8)
	(= (x plant8) 5)
	(= (y plant8) 5)
	(= (x plant6) 5)
	(= (y plant6) 5)
	(= (x plant4) 9)
	(= (y plant4) 9)
	(= (x plant7) 7)
	(= (y plant7) 7)
	(= (x tap1) 2)
	(= (y tap1) 2)
	(= (x plant5) 1)
	(= (y plant5) 1)
	(= (x plant9) 2)
	(= (y plant9) 2)
  )

  (:goal (and 
    (= (poured plant1) 3)
	(= (poured plant2) 7)
	(= (poured plant3) 3)
	(= (poured plant4) 1)
	(= (poured plant5) 9)
	(= (poured plant6) 5)
	(= (poured plant7) 7)
	(= (poured plant8) 2)
	(= (poured plant9) 1)
	(= (poured plant10) 4)
	(= (total_poured) (+ (+ (+ (+ (+ (+ (+ (+ (+ (poured plant1) (poured plant2)) (poured plant3)) (poured plant4)) (poured plant5)) (poured plant6)) (poured plant7)) (poured plant8)) (poured plant9)) (poured plant10)) )
  ))

  
  

  


(:constraints (and 
    (always 
		
		(forall (?p1 - plant ?p2 - plant ?p3 - plant) 
			(imply (and (not (= ?p1 ?p2)) (not (= ?p1 ?p3)) (not (= ?p2 ?p3))) (<= (carrying) (+ (poured ?p1) (+ (poured ?p2) (+ (poured ?p3) 1)))))
			
		)
	)
    ))

)