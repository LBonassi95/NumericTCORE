
(define (problem instance_11_1)
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
	(= (x agent1) 11)
	(= (y agent1) 6)
	(= (x plant12) 9)
	(= (y plant12) 9)
	(= (x plant10) 5)
	(= (y plant10) 5)
	(= (x plant1) 10)
	(= (y plant1) 10)
	(= (x plant8) 10)
	(= (y plant8) 10)
	(= (x plant5) 10)
	(= (y plant5) 10)
	(= (x plant7) 5)
	(= (y plant7) 5)
	(= (x plant4) 2)
	(= (y plant4) 2)
	(= (x plant3) 7)
	(= (y plant3) 7)
	(= (x plant9) 1)
	(= (y plant9) 1)
	(= (x plant6) 1)
	(= (y plant6) 1)
	(= (x plant11) 10)
	(= (y plant11) 10)
	(= (x tap1) 3)
	(= (y tap1) 3)
	(= (x plant2) 4)
	(= (y plant2) 4)
  )

  (:goal (and 
    (= (poured plant1) 8)
	(= (poured plant2) 7)
	(= (poured plant3) 10)
	(= (poured plant4) 7)
	(= (poured plant5) 4)
	(= (poured plant6) 7)
	(= (poured plant7) 2)
	(= (poured plant8) 4)
	(= (poured plant9) 3)
	(= (poured plant10) 6)
	(= (poured plant11) 7)
	(= (poured plant12) 2)
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