
(define (problem instance_13_2)
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
	(= (x agent1) 12)
	(= (y agent1) 4)
	(= (x plant12) 10)
	(= (y plant12) 10)
	(= (x plant10) 11)
	(= (y plant10) 11)
	(= (x plant1) 3)
	(= (y plant1) 3)
	(= (x plant8) 3)
	(= (y plant8) 3)
	(= (x plant14) 10)
	(= (y plant14) 10)
	(= (x plant11) 5)
	(= (y plant11) 5)
	(= (x plant16) 7)
	(= (y plant16) 7)
	(= (x plant7) 9)
	(= (y plant7) 9)
	(= (x plant13) 9)
	(= (y plant13) 9)
	(= (x plant3) 13)
	(= (y plant3) 13)
	(= (x plant9) 8)
	(= (y plant9) 8)
	(= (x plant4) 13)
	(= (y plant4) 13)
	(= (x plant6) 6)
	(= (y plant6) 6)
	(= (x plant15) 6)
	(= (y plant15) 6)
	(= (x tap1) 11)
	(= (y tap1) 11)
	(= (x plant5) 3)
	(= (y plant5) 3)
	(= (x plant2) 4)
	(= (y plant2) 4)
  )

  (:goal (and 
    (= (poured plant1) 7)
	(= (poured plant2) 9)
	(= (poured plant3) 3)
	(= (poured plant4) 10)
	(= (poured plant5) 8)
	(= (poured plant6) 2)
	(= (poured plant7) 9)
	(= (poured plant8) 5)
	(= (poured plant9) 8)
	(= (poured plant10) 10)
	(= (poured plant11) 5)
	(= (poured plant12) 9)
	(= (poured plant13) 1)
	(= (poured plant14) 8)
	(= (poured plant15) 9)
	(= (poured plant16) 1)
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