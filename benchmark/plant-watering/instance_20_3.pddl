
(define (problem instance_20_3)
  (:domain mt-plant-watering)
  (:objects
    tap1 - tap
	agent1 - agent
	plant12 plant10 plant20 plant8 plant21 plant27 plant39 plant5 plant7 plant13 plant22 plant36 plant35 plant3 plant9 plant24 plant33 plant34 plant4 plant25 plant37 plant17 plant38 plant19 plant31 plant1 plant30 plant14 plant40 plant11 plant16 plant23 plant6 plant2 plant29 plant32 plant26 plant15 plant28 plant18 - plant
  )

  (:init
    (= (max_int) 800)
	(= (maxx) 20)
	(= (minx) 1)
	(= (maxy) 20)
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
	(= (poured plant20) 0)
	(= (poured plant21) 0)
	(= (poured plant22) 0)
	(= (poured plant23) 0)
	(= (poured plant24) 0)
	(= (poured plant25) 0)
	(= (poured plant26) 0)
	(= (poured plant27) 0)
	(= (poured plant28) 0)
	(= (poured plant29) 0)
	(= (poured plant30) 0)
	(= (poured plant31) 0)
	(= (poured plant32) 0)
	(= (poured plant33) 0)
	(= (poured plant34) 0)
	(= (poured plant35) 0)
	(= (poured plant36) 0)
	(= (poured plant37) 0)
	(= (poured plant38) 0)
	(= (poured plant39) 0)
	(= (poured plant40) 0)
	(= (x agent1) 16)
	(= (y agent1) 1)
	(= (x plant12) 15)
	(= (y plant12) 15)
	(= (x plant10) 1)
	(= (y plant10) 1)
	(= (x plant20) 16)
	(= (y plant20) 16)
	(= (x tap1) 18)
	(= (y tap1) 18)
	(= (x plant28) 10)
	(= (y plant28) 10)
	(= (x plant8) 17)
	(= (y plant8) 17)
	(= (x plant21) 11)
	(= (y plant21) 11)
	(= (x plant27) 18)
	(= (y plant27) 18)
	(= (x plant39) 3)
	(= (y plant39) 3)
	(= (x plant5) 1)
	(= (y plant5) 1)
	(= (x plant7) 7)
	(= (y plant7) 7)
	(= (x plant13) 2)
	(= (y plant13) 2)
	(= (x plant22) 9)
	(= (y plant22) 9)
	(= (x plant3) 13)
	(= (y plant3) 13)
	(= (x plant9) 10)
	(= (y plant9) 10)
	(= (x plant24) 14)
	(= (y plant24) 14)
	(= (x plant34) 13)
	(= (y plant34) 13)
	(= (x plant4) 8)
	(= (y plant4) 8)
	(= (x plant25) 17)
	(= (y plant25) 17)
	(= (x plant1) 16)
	(= (y plant1) 16)
	(= (x plant17) 16)
	(= (y plant17) 16)
	(= (x plant38) 2)
	(= (y plant38) 2)
	(= (x plant19) 2)
	(= (y plant19) 2)
	(= (x plant31) 20)
	(= (y plant31) 20)
	(= (x plant33) 9)
	(= (y plant33) 9)
	(= (x plant36) 15)
	(= (y plant36) 15)
	(= (x plant14) 17)
	(= (y plant14) 17)
	(= (x plant40) 20)
	(= (y plant40) 20)
	(= (x plant15) 4)
	(= (y plant15) 4)
	(= (x plant35) 1)
	(= (y plant35) 1)
	(= (x plant37) 9)
	(= (y plant37) 9)
	(= (x plant23) 4)
	(= (y plant23) 4)
	(= (x plant30) 12)
	(= (y plant30) 12)
	(= (x plant6) 1)
	(= (y plant6) 1)
	(= (x plant2) 16)
	(= (y plant2) 16)
	(= (x plant29) 9)
	(= (y plant29) 9)
	(= (x plant32) 15)
	(= (y plant32) 15)
	(= (x plant26) 1)
	(= (y plant26) 1)
	(= (x plant11) 5)
	(= (y plant11) 5)
	(= (x plant16) 2)
	(= (y plant16) 2)
	(= (x plant18) 7)
	(= (y plant18) 7)
  )

  (:goal (and 
    (= (poured plant1) 2)
	(= (poured plant2) 3)
	(= (poured plant3) 9)
	(= (poured plant4) 3)
	(= (poured plant5) 1)
	(= (poured plant6) 8)
	(= (poured plant7) 7)
	(= (poured plant8) 9)
	(= (poured plant9) 4)
	(= (poured plant10) 7)
	(= (poured plant11) 1)
	(= (poured plant12) 1)
	(= (poured plant13) 1)
	(= (poured plant14) 4)
	(= (poured plant15) 9)
	(= (poured plant16) 2)
	(= (poured plant17) 4)
	(= (poured plant18) 9)
	(= (poured plant19) 5)
	(= (poured plant20) 5)
	(= (poured plant21) 6)
	(= (poured plant22) 6)
	(= (poured plant23) 9)
	(= (poured plant24) 3)
	(= (poured plant25) 1)
	(= (poured plant26) 6)
	(= (poured plant27) 4)
	(= (poured plant28) 4)
	(= (poured plant29) 3)
	(= (poured plant30) 3)
	(= (poured plant31) 5)
	(= (poured plant32) 10)
	(= (poured plant33) 5)
	(= (poured plant34) 8)
	(= (poured plant35) 3)
	(= (poured plant36) 7)
	(= (poured plant37) 7)
	(= (poured plant38) 4)
	(= (poured plant39) 2)
	(= (poured plant40) 9)
	(= (total_poured) (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (+ (poured plant1) (poured plant2)) (poured plant3)) (poured plant4)) (poured plant5)) (poured plant6)) (poured plant7)) (poured plant8)) (poured plant9)) (poured plant10)) (poured plant11)) (poured plant12)) (poured plant13)) (poured plant14)) (poured plant15)) (poured plant16)) (poured plant17)) (poured plant18)) (poured plant19)) (poured plant20)) (poured plant21)) (poured plant22)) (poured plant23)) (poured plant24)) (poured plant25)) (poured plant26)) (poured plant27)) (poured plant28)) (poured plant29)) (poured plant30)) (poured plant31)) (poured plant32)) (poured plant33)) (poured plant34)) (poured plant35)) (poured plant36)) (poured plant37)) (poured plant38)) (poured plant39)) (poured plant40)) )
  ))

  
  

  


(:constraints (and 
    (always 
		
		(forall (?p1 - plant ?p2 - plant ?p3 - plant) 
			(imply (and (not (= ?p1 ?p2)) (not (= ?p1 ?p3)) (not (= ?p2 ?p3))) (<= (carrying) (+ (poured ?p1) (+ (poured ?p2) (+ (poured ?p3) 1)))))
			
		)
	)
    ))

)