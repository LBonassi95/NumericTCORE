
(define (problem instance_20_10_2_2)
  (:domain mt-block-grouping)
  (:objects
    b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 - block
  )

  (:init
    (= (x b9) 15)
	(= (y b9) 20)
	(= (x b5) 13)
	(= (y b5) 3)
	(= (x b4) 11)
	(= (y b4) 18)
	(= (x b2) 12)
	(= (y b2) 2)
	(= (x b1) 6)
	(= (y b1) 16)
	(= (x b10) 17)
	(= (y b10) 8)
	(= (x b8) 7)
	(= (y b8) 18)
	(= (x b3) 1)
	(= (y b3) 14)
	(= (x b6) 17)
	(= (y b6) 5)
	(= (x b7) 19)
	(= (y b7) 11)
	(= (max_x) 20 )
	(= (min_x) 1 )
	(= (max_y) 20 )
	(= (min_y) 1 )
  )

  (:goal (and 
    (= (x b1) (x b2))
(= (y b1) (y b2))
	(or (not (= (x b1) (x b3))) (not (= (y b1) (y b3))))
	(or (not (= (x b1) (x b4))) (not (= (y b1) (y b4))))
	(or (not (= (x b1) (x b5))) (not (= (y b1) (y b5))))
	(or (not (= (x b1) (x b6))) (not (= (y b1) (y b6))))
	(or (not (= (x b1) (x b7))) (not (= (y b1) (y b7))))
	(= (x b1) (x b8))
(= (y b1) (y b8))
	(= (x b1) (x b9))
(= (y b1) (y b9))
	(= (x b1) (x b10))
(= (y b1) (y b10))
	(or (not (= (x b2) (x b3))) (not (= (y b2) (y b3))))
	(or (not (= (x b2) (x b4))) (not (= (y b2) (y b4))))
	(or (not (= (x b2) (x b5))) (not (= (y b2) (y b5))))
	(or (not (= (x b2) (x b6))) (not (= (y b2) (y b6))))
	(or (not (= (x b2) (x b7))) (not (= (y b2) (y b7))))
	(= (x b2) (x b8))
(= (y b2) (y b8))
	(= (x b2) (x b9))
(= (y b2) (y b9))
	(= (x b3) (x b4))
(= (y b3) (y b4))
	(= (x b3) (x b5))
(= (y b3) (y b5))
	(= (x b3) (x b6))
(= (y b3) (y b6))
	(= (x b3) (x b7))
(= (y b3) (y b7))
	(or (not (= (x b3) (x b8))) (not (= (y b3) (y b8))))
	(or (not (= (x b3) (x b9))) (not (= (y b3) (y b9))))
	(= (x b4) (x b5))
(= (y b4) (y b5))
	(= (x b4) (x b6))
(= (y b4) (y b6))
	(= (x b4) (x b7))
(= (y b4) (y b7))
	(or (not (= (x b4) (x b8))) (not (= (y b4) (y b8))))
	(or (not (= (x b4) (x b9))) (not (= (y b4) (y b9))))
	(= (x b5) (x b6))
(= (y b5) (y b6))
	(= (x b5) (x b7))
(= (y b5) (y b7))
	(or (not (= (x b5) (x b8))) (not (= (y b5) (y b8))))
	(or (not (= (x b5) (x b9))) (not (= (y b5) (y b9))))
	(= (x b6) (x b7))
(= (y b6) (y b7))
	(or (not (= (x b6) (x b8))) (not (= (y b6) (y b8))))
	(or (not (= (x b6) (x b9))) (not (= (y b6) (y b9))))
	(or (not (= (x b7) (x b8))) (not (= (y b7) (y b8))))
	(or (not (= (x b7) (x b9))) (not (= (y b7) (y b9))))
	(= (x b8) (x b9))
(= (y b8) (y b9))
	(= (x b10) (x b2))
(= (y b10) (y b2))
	(or (not (= (x b10) (x b3))) (not (= (y b10) (y b3))))
	(or (not (= (x b10) (x b4))) (not (= (y b10) (y b4))))
	(or (not (= (x b10) (x b5))) (not (= (y b10) (y b5))))
	(or (not (= (x b10) (x b6))) (not (= (y b10) (y b6))))
	(or (not (= (x b10) (x b7))) (not (= (y b10) (y b7))))
	(= (x b10) (x b8))
(= (y b10) (y b8))
	(= (x b10) (x b9))
(= (y b10) (y b9))
  ))

  
  

  


(:constraints (and (at-most-once (and (>= (x b1) 1) (< (x b1) 5)))
(at-most-once (and (>= (y b1) 1) (< (y b1) 5)))
(at-most-once (and (>= (x b2) 1) (< (x b2) 5)))
(at-most-once (and (>= (y b2) 1) (< (y b2) 5)))
(at-most-once (and (>= (x b3) 1) (< (x b3) 5)))
(at-most-once (and (>= (y b3) 1) (< (y b3) 5)))
(at-most-once (and (>= (x b4) 1) (< (x b4) 5)))
(at-most-once (and (>= (y b4) 1) (< (y b4) 5)))
(at-most-once (and (>= (x b5) 1) (< (x b5) 5)))
(at-most-once (and (>= (y b5) 1) (< (y b5) 5)))
(at-most-once (and (>= (x b6) 1) (< (x b6) 5)))
(at-most-once (and (>= (y b6) 1) (< (y b6) 5)))
(at-most-once (and (>= (x b7) 1) (< (x b7) 5)))
(at-most-once (and (>= (y b7) 1) (< (y b7) 5)))
(at-most-once (and (>= (x b8) 1) (< (x b8) 5)))
(at-most-once (and (>= (y b8) 1) (< (y b8) 5)))
(at-most-once (and (>= (x b9) 1) (< (x b9) 5)))
(at-most-once (and (>= (y b9) 1) (< (y b9) 5)))
(at-most-once (and (>= (x b10) 1) (< (x b10) 5)))
(at-most-once (and (>= (y b10) 1) (< (y b10) 5)))
(at-most-once (and (>= (x b1) 5) (< (x b1) 9)))
(at-most-once (and (>= (y b1) 5) (< (y b1) 9)))
(at-most-once (and (>= (x b2) 5) (< (x b2) 9)))
(at-most-once (and (>= (y b2) 5) (< (y b2) 9)))
(at-most-once (and (>= (x b3) 5) (< (x b3) 9)))
(at-most-once (and (>= (y b3) 5) (< (y b3) 9)))
(at-most-once (and (>= (x b4) 5) (< (x b4) 9)))
(at-most-once (and (>= (y b4) 5) (< (y b4) 9)))
(at-most-once (and (>= (x b5) 5) (< (x b5) 9)))
(at-most-once (and (>= (y b5) 5) (< (y b5) 9)))
(at-most-once (and (>= (x b6) 5) (< (x b6) 9)))
(at-most-once (and (>= (y b6) 5) (< (y b6) 9)))
(at-most-once (and (>= (x b7) 5) (< (x b7) 9)))
(at-most-once (and (>= (y b7) 5) (< (y b7) 9)))
(at-most-once (and (>= (x b8) 5) (< (x b8) 9)))
(at-most-once (and (>= (y b8) 5) (< (y b8) 9)))
(at-most-once (and (>= (x b9) 5) (< (x b9) 9)))
(at-most-once (and (>= (y b9) 5) (< (y b9) 9)))
(at-most-once (and (>= (x b10) 5) (< (x b10) 9)))
(at-most-once (and (>= (y b10) 5) (< (y b10) 9)))
(at-most-once (and (>= (x b1) 9) (< (x b1) 13)))
(at-most-once (and (>= (y b1) 9) (< (y b1) 13)))
(at-most-once (and (>= (x b2) 9) (< (x b2) 13)))
(at-most-once (and (>= (y b2) 9) (< (y b2) 13)))
(at-most-once (and (>= (x b3) 9) (< (x b3) 13)))
(at-most-once (and (>= (y b3) 9) (< (y b3) 13)))
(at-most-once (and (>= (x b4) 9) (< (x b4) 13)))
(at-most-once (and (>= (y b4) 9) (< (y b4) 13)))
(at-most-once (and (>= (x b5) 9) (< (x b5) 13)))
(at-most-once (and (>= (y b5) 9) (< (y b5) 13)))
(at-most-once (and (>= (x b6) 9) (< (x b6) 13)))
(at-most-once (and (>= (y b6) 9) (< (y b6) 13)))
(at-most-once (and (>= (x b7) 9) (< (x b7) 13)))
(at-most-once (and (>= (y b7) 9) (< (y b7) 13)))
(at-most-once (and (>= (x b8) 9) (< (x b8) 13)))
(at-most-once (and (>= (y b8) 9) (< (y b8) 13)))
(at-most-once (and (>= (x b9) 9) (< (x b9) 13)))
(at-most-once (and (>= (y b9) 9) (< (y b9) 13)))
(at-most-once (and (>= (x b10) 9) (< (x b10) 13)))
(at-most-once (and (>= (y b10) 9) (< (y b10) 13)))
(at-most-once (and (>= (x b1) 13) (< (x b1) 17)))
(at-most-once (and (>= (y b1) 13) (< (y b1) 17)))
(at-most-once (and (>= (x b2) 13) (< (x b2) 17)))
(at-most-once (and (>= (y b2) 13) (< (y b2) 17)))
(at-most-once (and (>= (x b3) 13) (< (x b3) 17)))
(at-most-once (and (>= (y b3) 13) (< (y b3) 17)))
(at-most-once (and (>= (x b4) 13) (< (x b4) 17)))
(at-most-once (and (>= (y b4) 13) (< (y b4) 17)))
(at-most-once (and (>= (x b5) 13) (< (x b5) 17)))
(at-most-once (and (>= (y b5) 13) (< (y b5) 17)))
(at-most-once (and (>= (x b6) 13) (< (x b6) 17)))
(at-most-once (and (>= (y b6) 13) (< (y b6) 17)))
(at-most-once (and (>= (x b7) 13) (< (x b7) 17)))
(at-most-once (and (>= (y b7) 13) (< (y b7) 17)))
(at-most-once (and (>= (x b8) 13) (< (x b8) 17)))
(at-most-once (and (>= (y b8) 13) (< (y b8) 17)))
(at-most-once (and (>= (x b9) 13) (< (x b9) 17)))
(at-most-once (and (>= (y b9) 13) (< (y b9) 17)))
(at-most-once (and (>= (x b10) 13) (< (x b10) 17)))
(at-most-once (and (>= (y b10) 13) (< (y b10) 17)))
(at-most-once (and (>= (x b1) 17) (< (x b1) 21)))
(at-most-once (and (>= (y b1) 17) (< (y b1) 21)))
(at-most-once (and (>= (x b2) 17) (< (x b2) 21)))
(at-most-once (and (>= (y b2) 17) (< (y b2) 21)))
(at-most-once (and (>= (x b3) 17) (< (x b3) 21)))
(at-most-once (and (>= (y b3) 17) (< (y b3) 21)))
(at-most-once (and (>= (x b4) 17) (< (x b4) 21)))
(at-most-once (and (>= (y b4) 17) (< (y b4) 21)))
(at-most-once (and (>= (x b5) 17) (< (x b5) 21)))
(at-most-once (and (>= (y b5) 17) (< (y b5) 21)))
(at-most-once (and (>= (x b6) 17) (< (x b6) 21)))
(at-most-once (and (>= (y b6) 17) (< (y b6) 21)))
(at-most-once (and (>= (x b7) 17) (< (x b7) 21)))
(at-most-once (and (>= (y b7) 17) (< (y b7) 21)))
(at-most-once (and (>= (x b8) 17) (< (x b8) 21)))
(at-most-once (and (>= (y b8) 17) (< (y b8) 21)))
(at-most-once (and (>= (x b9) 17) (< (x b9) 21)))
(at-most-once (and (>= (y b9) 17) (< (y b9) 21)))
(at-most-once (and (>= (x b10) 17) (< (x b10) 21)))
(at-most-once (and (>= (y b10) 17) (< (y b10) 21)))))

)