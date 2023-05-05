
(define (problem instance_13_1)
  (:domain mt-plant-watering)
  (:objects
    tap1 - tap
	agent1 - agent
	plant12 plant10 plant1 plant8 plant14 plant15 plant16 plant5 plant7 plant13 plant3 plant9 plant6 plant11 plant4 plant2 - plant
  )

  (:init
    (= (max_int) 320)
	(= (maxx) 13)
	(= (minx) 1)
	(= (maxy) 13)
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
	(= (poured plant15) 0)
	(= (poured plant16) 0)
	(= (x agent1) 6)
	(= (y agent1) 13)
	(= (x plant12) 2)
	(= (y plant12) 2)
	(= (x plant10) 6)
	(= (y plant10) 6)
	(= (x plant1) 12)
	(= (y plant1) 12)
	(= (x plant8) 1)
	(= (y plant8) 1)
	(= (x plant14) 9)
	(= (y plant14) 9)
	(= (x plant11) 1)
	(= (y plant11) 1)
	(= (x plant16) 9)
	(= (y plant16) 9)
	(= (x plant7) 5)
	(= (y plant7) 5)
	(= (x plant13) 9)
	(= (y plant13) 9)
	(= (x plant3) 9)
	(= (y plant3) 9)
	(= (x plant9) 2)
	(= (y plant9) 2)
	(= (x plant4) 2)
	(= (y plant4) 2)
	(= (x plant6) 12)
	(= (y plant6) 12)
	(= (x plant15) 4)
	(= (y plant15) 4)
	(= (x tap1) 12)
	(= (y tap1) 12)
	(= (x plant5) 2)
	(= (y plant5) 2)
	(= (x plant2) 7)
	(= (y plant2) 7)
  )

  (:goal (and 
    (= (poured plant1) 7)
	(= (poured plant2) 7)
	(= (poured plant3) 8)
	(= (poured plant4) 8)
	(= (poured plant5) 5)
	(= (poured plant6) 1)
	(= (poured plant7) 2)
	(= (poured plant8) 9)
	(= (poured plant9) 10)
	(= (poured plant10) 2)
	(= (poured plant11) 9)
	(= (poured plant12) 2)
	(= (poured plant13) 1)
	(= (poured plant14) 2)
	(= (poured plant15) 10)
	(= (poured plant16) 4)
	(= (total_poured) (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (poured plant1) (poured plant2)) (poured plant3)) (poured plant4)) (poured plant5)) (poured plant6)) (poured plant7)) (poured plant8)) (poured plant9)) (poured plant10)) (poured plant11)) (poured plant12)) (poured plant13)) (poured plant14)) (poured plant15)) (poured plant16)) )
  ))

  
  

  


(:constraints (and 
    (always 
		
		(forall (?p1 - plant ?p2 - plant ?p3 - plant) 
			(imply (and (not (= ?p1 ?p2)) (not (= ?p1 ?p3)) (not (= ?p2 ?p3))) (<= (carrying) (+ (poured ?p1) (+ (poured ?p2) (+ (poured ?p3) 1)))))
			
		)
	)
    ))

)