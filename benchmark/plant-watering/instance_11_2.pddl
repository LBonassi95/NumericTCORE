
(define (problem instance_11_2)
  (:domain mt-plant-watering)
  (:objects
    tap1 - tap
	agent1 - agent
	plant12 plant10 plant1 plant8 plant5 plant7 plant3 plant9 plant6 plant11 plant4 plant2 - plant
  )

  (:init
    (= (max_int) 240)
	(= (maxx) 11)
	(= (minx) 1)
	(= (maxy) 11)
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
	(= (poured plant11) 0)
	(= (poured plant12) 0)
	(= (x agent1) 8)
	(= (y agent1) 6)
	(= (x plant12) 2)
	(= (y plant12) 2)
	(= (x plant10) 2)
	(= (y plant10) 2)
	(= (x plant1) 3)
	(= (y plant1) 3)
	(= (x plant8) 9)
	(= (y plant8) 9)
	(= (x plant5) 4)
	(= (y plant5) 4)
	(= (x plant7) 9)
	(= (y plant7) 9)
	(= (x plant4) 11)
	(= (y plant4) 11)
	(= (x plant3) 10)
	(= (y plant3) 10)
	(= (x plant9) 4)
	(= (y plant9) 4)
	(= (x plant6) 11)
	(= (y plant6) 11)
	(= (x plant11) 5)
	(= (y plant11) 5)
	(= (x tap1) 3)
	(= (y tap1) 3)
	(= (x plant2) 4)
	(= (y plant2) 4)
  )

  (:goal (and 
    (= (poured plant1) 8)
	(= (poured plant2) 6)
	(= (poured plant3) 10)
	(= (poured plant4) 9)
	(= (poured plant5) 4)
	(= (poured plant6) 8)
	(= (poured plant7) 5)
	(= (poured plant8) 9)
	(= (poured plant9) 6)
	(= (poured plant10) 6)
	(= (poured plant11) 5)
	(= (poured plant12) 10)
	(= (total_poured) (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (poured plant1) (poured plant2)) (poured plant3)) (poured plant4)) (poured plant5)) (poured plant6)) (poured plant7)) (poured plant8)) (poured plant9)) (poured plant10)) (poured plant11)) (poured plant12)) )
  ))

  
  

  


(:constraints (and 
    (always 
		
		(forall (?p1 - plant ?p2 - plant ?p3 - plant) 
			(imply (and (not (= ?p1 ?p2)) (not (= ?p1 ?p3)) (not (= ?p2 ?p3))) (<= (carrying) (+ (poured ?p1) (+ (poured ?p2) (+ (poured ?p3) 1)))))
			
		)
	)
    ))

)