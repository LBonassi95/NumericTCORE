
(define (problem instance_12_3)
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
	(= (x agent1) 3)
	(= (y agent1) 1)
	(= (x plant12) 1)
	(= (y plant12) 1)
	(= (x plant10) 10)
	(= (y plant10) 10)
	(= (x plant1) 5)
	(= (y plant1) 5)
	(= (x plant8) 12)
	(= (y plant8) 12)
	(= (x plant14) 3)
	(= (y plant14) 3)
	(= (x plant5) 5)
	(= (y plant5) 5)
	(= (x plant7) 12)
	(= (y plant7) 12)
	(= (x plant13) 7)
	(= (y plant13) 7)
	(= (x plant3) 7)
	(= (y plant3) 7)
	(= (x plant9) 3)
	(= (y plant9) 3)
	(= (x plant4) 3)
	(= (y plant4) 3)
	(= (x plant6) 11)
	(= (y plant6) 11)
	(= (x plant11) 5)
	(= (y plant11) 5)
	(= (x tap1) 5)
	(= (y tap1) 5)
	(= (x plant2) 4)
	(= (y plant2) 4)
  )

  (:goal (and 
    (= (poured plant1) 7)
	(= (poured plant2) 2)
	(= (poured plant3) 5)
	(= (poured plant4) 5)
	(= (poured plant5) 8)
	(= (poured plant6) 4)
	(= (poured plant7) 3)
	(= (poured plant8) 7)
	(= (poured plant9) 1)
	(= (poured plant10) 6)
	(= (poured plant11) 4)
	(= (poured plant12) 10)
	(= (poured plant13) 1)
	(= (poured plant14) 1)
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