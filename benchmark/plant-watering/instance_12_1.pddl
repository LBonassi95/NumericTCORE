
(define (problem instance_12_1)
  (:domain mt-plant-watering)
  (:objects
    tap1 - tap
	agent1 - agent
	plant12 plant10 plant1 plant8 plant14 plant5 plant7 plant13 plant3 plant9 plant6 plant11 plant4 plant2 - plant
  )

  (:init
    (= (max_int) 280)
	(= (maxx) 12)
	(= (minx) 1)
	(= (maxy) 12)
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
	(= (poured plant13) 0)
	(= (poured plant14) 0)
	(= (x agent1) 10)
	(= (y agent1) 11)
	(= (x plant12) 5)
	(= (y plant12) 5)
	(= (x plant10) 1)
	(= (y plant10) 1)
	(= (x plant1) 3)
	(= (y plant1) 3)
	(= (x plant8) 6)
	(= (y plant8) 6)
	(= (x plant14) 3)
	(= (y plant14) 3)
	(= (x plant5) 2)
	(= (y plant5) 2)
	(= (x plant7) 1)
	(= (y plant7) 1)
	(= (x plant13) 8)
	(= (y plant13) 8)
	(= (x plant3) 11)
	(= (y plant3) 11)
	(= (x plant9) 11)
	(= (y plant9) 11)
	(= (x plant4) 2)
	(= (y plant4) 2)
	(= (x plant6) 8)
	(= (y plant6) 8)
	(= (x plant11) 11)
	(= (y plant11) 11)
	(= (x tap1) 9)
	(= (y tap1) 9)
	(= (x plant2) 9)
	(= (y plant2) 9)
  )

  (:goal (and 
    (= (poured plant1) 5)
	(= (poured plant2) 5)
	(= (poured plant3) 8)
	(= (poured plant4) 1)
	(= (poured plant5) 7)
	(= (poured plant6) 9)
	(= (poured plant7) 8)
	(= (poured plant8) 6)
	(= (poured plant9) 9)
	(= (poured plant10) 9)
	(= (poured plant11) 6)
	(= (poured plant12) 5)
	(= (poured plant13) 8)
	(= (poured plant14) 5)
	(= (total_poured) (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (poured plant1) (poured plant2)) (poured plant3)) (poured plant4)) (poured plant5)) (poured plant6)) (poured plant7)) (poured plant8)) (poured plant9)) (poured plant10)) (poured plant11)) (poured plant12)) (poured plant13)) (poured plant14)) )
  ))

  
  

  


(:constraints (and 
    (always 
		
		(forall (?p1 - plant ?p2 - plant ?p3 - plant) 
			(imply (and (not (= ?p1 ?p2)) (not (= ?p1 ?p3)) (not (= ?p2 ?p3))) (<= (carrying) (+ (poured ?p1) (+ (poured ?p2) (+ (poured ?p3) 1)))))
			
		)
	)
    ))

)