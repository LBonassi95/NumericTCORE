
(define (problem instance_13_3)
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
	(= (x agent1) 4)
	(= (y agent1) 4)
	(= (x plant12) 3)
	(= (y plant12) 3)
	(= (x plant10) 12)
	(= (y plant10) 12)
	(= (x plant1) 10)
	(= (y plant1) 10)
	(= (x plant8) 11)
	(= (y plant8) 11)
	(= (x plant14) 10)
	(= (y plant14) 10)
	(= (x plant11) 12)
	(= (y plant11) 12)
	(= (x plant16) 8)
	(= (y plant16) 8)
	(= (x plant7) 3)
	(= (y plant7) 3)
	(= (x plant13) 6)
	(= (y plant13) 6)
	(= (x plant3) 8)
	(= (y plant3) 8)
	(= (x plant9) 13)
	(= (y plant9) 13)
	(= (x plant4) 5)
	(= (y plant4) 5)
	(= (x plant6) 12)
	(= (y plant6) 12)
	(= (x plant15) 8)
	(= (y plant15) 8)
	(= (x tap1) 11)
	(= (y tap1) 11)
	(= (x plant5) 10)
	(= (y plant5) 10)
	(= (x plant2) 5)
	(= (y plant2) 5)
  )

  (:goal (and 
    (= (poured plant1) 4)
	(= (poured plant2) 8)
	(= (poured plant3) 5)
	(= (poured plant4) 5)
	(= (poured plant5) 10)
	(= (poured plant6) 5)
	(= (poured plant7) 5)
	(= (poured plant8) 8)
	(= (poured plant9) 9)
	(= (poured plant10) 4)
	(= (poured plant11) 4)
	(= (poured plant12) 1)
	(= (poured plant13) 7)
	(= (poured plant14) 10)
	(= (poured plant15) 6)
	(= (poured plant16) 6)
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