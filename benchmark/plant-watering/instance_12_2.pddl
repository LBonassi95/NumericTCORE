
(define (problem instance_12_2)
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
	(= (y agent1) 5)
	(= (x plant12) 2)
	(= (y plant12) 2)
	(= (x plant10) 12)
	(= (y plant10) 12)
	(= (x plant1) 11)
	(= (y plant1) 11)
	(= (x plant8) 12)
	(= (y plant8) 12)
	(= (x plant14) 3)
	(= (y plant14) 3)
	(= (x plant5) 4)
	(= (y plant5) 4)
	(= (x plant7) 6)
	(= (y plant7) 6)
	(= (x plant13) 9)
	(= (y plant13) 9)
	(= (x plant3) 3)
	(= (y plant3) 3)
	(= (x plant9) 1)
	(= (y plant9) 1)
	(= (x plant4) 4)
	(= (y plant4) 4)
	(= (x plant6) 10)
	(= (y plant6) 10)
	(= (x plant11) 12)
	(= (y plant11) 12)
	(= (x tap1) 10)
	(= (y tap1) 10)
	(= (x plant2) 7)
	(= (y plant2) 7)
  )

  (:goal (and 
    (= (poured plant1) 10)
	(= (poured plant2) 2)
	(= (poured plant3) 1)
	(= (poured plant4) 7)
	(= (poured plant5) 5)
	(= (poured plant6) 9)
	(= (poured plant7) 8)
	(= (poured plant8) 4)
	(= (poured plant9) 8)
	(= (poured plant10) 1)
	(= (poured plant11) 6)
	(= (poured plant12) 5)
	(= (poured plant13) 8)
	(= (poured plant14) 6)
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