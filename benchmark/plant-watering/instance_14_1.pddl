
(define (problem instance_14_1)
  (:domain mt-plant-watering)
  (:objects
    tap1 - tap
	agent1 - agent
	plant12 plant10 plant19 plant1 plant8 plant14 plant15 plant16 plant5 plant7 plant13 plant17 plant3 plant9 plant6 plant18 plant11 plant4 plant2 - plant
  )

  (:init
    (= (max_int) 380)
	(= (maxx) 14)
	(= (minx) 1)
	(= (maxy) 14)
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
	(= (poured plant17) 0)
	(= (poured plant18) 0)
	(= (poured plant19) 0)
	(= (x agent1) 6)
	(= (y agent1) 5)
	(= (x plant12) 9)
	(= (y plant12) 9)
	(= (x plant10) 5)
	(= (y plant10) 5)
	(= (x plant19) 14)
	(= (y plant19) 14)
	(= (x plant1) 2)
	(= (y plant1) 2)
	(= (x plant8) 3)
	(= (y plant8) 3)
	(= (x plant14) 7)
	(= (y plant14) 7)
	(= (x plant11) 7)
	(= (y plant11) 7)
	(= (x plant16) 14)
	(= (y plant16) 14)
	(= (x plant7) 12)
	(= (y plant7) 12)
	(= (x plant13) 4)
	(= (y plant13) 4)
	(= (x plant17) 3)
	(= (y plant17) 3)
	(= (x plant2) 9)
	(= (y plant2) 9)
	(= (x plant3) 10)
	(= (y plant3) 10)
	(= (x plant9) 10)
	(= (y plant9) 10)
	(= (x plant4) 1)
	(= (y plant4) 1)
	(= (x plant6) 7)
	(= (y plant6) 7)
	(= (x plant15) 1)
	(= (y plant15) 1)
	(= (x tap1) 11)
	(= (y tap1) 11)
	(= (x plant5) 13)
	(= (y plant5) 13)
	(= (x plant18) 1)
	(= (y plant18) 1)
  )

  (:goal (and 
    (= (poured plant1) 8)
	(= (poured plant2) 7)
	(= (poured plant3) 4)
	(= (poured plant4) 4)
	(= (poured plant5) 3)
	(= (poured plant6) 6)
	(= (poured plant7) 1)
	(= (poured plant8) 10)
	(= (poured plant9) 10)
	(= (poured plant10) 1)
	(= (poured plant11) 10)
	(= (poured plant12) 10)
	(= (poured plant13) 7)
	(= (poured plant14) 2)
	(= (poured plant15) 8)
	(= (poured plant16) 1)
	(= (poured plant17) 2)
	(= (poured plant18) 1)
	(= (poured plant19) 6)
	(= (total_poured) (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (poured plant1) (poured plant2)) (poured plant3)) (poured plant4)) (poured plant5)) (poured plant6)) (poured plant7)) (poured plant8)) (poured plant9)) (poured plant10)) (poured plant11)) (poured plant12)) (poured plant13)) (poured plant14)) (poured plant15)) (poured plant16)) (poured plant17)) (poured plant18)) (poured plant19)) )
  ))

  
  

  


(:constraints (and 
    (always 
		
		(forall (?p1 - plant ?p2 - plant ?p3 - plant) 
			(imply (and (not (= ?p1 ?p2)) (not (= ?p1 ?p3)) (not (= ?p2 ?p3))) (<= (carrying) (+ (poured ?p1) (+ (poured ?p2) (+ (poured ?p3) 1)))))
			
		)
	)
    ))

)