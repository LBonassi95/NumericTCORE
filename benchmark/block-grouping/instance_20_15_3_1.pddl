
(define (problem instance_20_15_3_1)
  (:domain mt-block-grouping)
  (:objects
    b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 b11 b12 b13 b14 b15 - block
  )

  (:init
    (= (x b5) 7)
	(= (y b5) 3)
	(= (x b4) 17)
	(= (y b4) 9)
	(= (x b2) 7)
	(= (y b2) 15)
	(= (x b3) 12)
	(= (y b3) 4)
	(= (x b8) 5)
	(= (y b8) 8)
	(= (x b14) 19)
	(= (y b14) 4)
	(= (x b9) 1)
	(= (y b9) 10)
	(= (x b15) 8)
	(= (y b15) 20)
	(= (x b10) 14)
	(= (y b10) 8)
	(= (x b1) 1)
	(= (y b1) 8)
	(= (x b12) 1)
	(= (y b12) 14)
	(= (x b11) 14)
	(= (y b11) 20)
	(= (x b6) 16)
	(= (y b6) 7)
	(= (x b7) 12)
	(= (y b7) 6)
	(= (x b13) 14)
	(= (y b13) 14)
	(= (max_x) 20 )
	(= (min_x) 1 )
	(= (max_y) 20 )
	(= (min_y) 1 )
  )

  (:goal (and 
    (or (not (= (x b1) (x b2))) (not (= (y b1) (y b2))))
	(= (x b1) (x b3))
(= (y b1) (y b3))
	(or (not (= (x b1) (x b4))) (not (= (y b1) (y b4))))
	(= (x b1) (x b5))
(= (y b1) (y b5))
	(= (x b1) (x b6))
(= (y b1) (y b6))
	(or (not (= (x b1) (x b7))) (not (= (y b1) (y b7))))
	(or (not (= (x b1) (x b8))) (not (= (y b1) (y b8))))
	(or (not (= (x b1) (x b9))) (not (= (y b1) (y b9))))
	(or (not (= (x b1) (x b10))) (not (= (y b1) (y b10))))
	(= (x b1) (x b11))
(= (y b1) (y b11))
	(or (not (= (x b1) (x b12))) (not (= (y b1) (y b12))))
	(or (not (= (x b1) (x b13))) (not (= (y b1) (y b13))))
	(or (not (= (x b1) (x b14))) (not (= (y b1) (y b14))))
	(or (not (= (x b1) (x b15))) (not (= (y b1) (y b15))))
	(or (not (= (x b2) (x b3))) (not (= (y b2) (y b3))))
	(or (not (= (x b2) (x b4))) (not (= (y b2) (y b4))))
	(or (not (= (x b2) (x b5))) (not (= (y b2) (y b5))))
	(or (not (= (x b2) (x b6))) (not (= (y b2) (y b6))))
	(or (not (= (x b2) (x b7))) (not (= (y b2) (y b7))))
	(or (not (= (x b2) (x b8))) (not (= (y b2) (y b8))))
	(= (x b2) (x b9))
(= (y b2) (y b9))
	(or (not (= (x b3) (x b4))) (not (= (y b3) (y b4))))
	(= (x b3) (x b5))
(= (y b3) (y b5))
	(= (x b3) (x b6))
(= (y b3) (y b6))
	(or (not (= (x b3) (x b7))) (not (= (y b3) (y b7))))
	(or (not (= (x b3) (x b8))) (not (= (y b3) (y b8))))
	(or (not (= (x b3) (x b9))) (not (= (y b3) (y b9))))
	(or (not (= (x b4) (x b5))) (not (= (y b4) (y b5))))
	(or (not (= (x b4) (x b6))) (not (= (y b4) (y b6))))
	(= (x b4) (x b7))
(= (y b4) (y b7))
	(= (x b4) (x b8))
(= (y b4) (y b8))
	(or (not (= (x b4) (x b9))) (not (= (y b4) (y b9))))
	(= (x b5) (x b6))
(= (y b5) (y b6))
	(or (not (= (x b5) (x b7))) (not (= (y b5) (y b7))))
	(or (not (= (x b5) (x b8))) (not (= (y b5) (y b8))))
	(or (not (= (x b5) (x b9))) (not (= (y b5) (y b9))))
	(or (not (= (x b6) (x b7))) (not (= (y b6) (y b7))))
	(or (not (= (x b6) (x b8))) (not (= (y b6) (y b8))))
	(or (not (= (x b6) (x b9))) (not (= (y b6) (y b9))))
	(= (x b7) (x b8))
(= (y b7) (y b8))
	(or (not (= (x b7) (x b9))) (not (= (y b7) (y b9))))
	(or (not (= (x b8) (x b9))) (not (= (y b8) (y b9))))
	(or (not (= (x b10) (x b2))) (not (= (y b10) (y b2))))
	(or (not (= (x b10) (x b3))) (not (= (y b10) (y b3))))
	(= (x b10) (x b4))
(= (y b10) (y b4))
	(or (not (= (x b10) (x b5))) (not (= (y b10) (y b5))))
	(or (not (= (x b10) (x b6))) (not (= (y b10) (y b6))))
	(= (x b10) (x b7))
(= (y b10) (y b7))
	(= (x b10) (x b8))
(= (y b10) (y b8))
	(or (not (= (x b10) (x b9))) (not (= (y b10) (y b9))))
	(or (not (= (x b10) (x b11))) (not (= (y b10) (y b11))))
	(= (x b10) (x b12))
(= (y b10) (y b12))
	(= (x b10) (x b13))
(= (y b10) (y b13))
	(= (x b10) (x b14))
(= (y b10) (y b14))
	(or (not (= (x b10) (x b15))) (not (= (y b10) (y b15))))
	(or (not (= (x b11) (x b2))) (not (= (y b11) (y b2))))
	(= (x b11) (x b3))
(= (y b11) (y b3))
	(or (not (= (x b11) (x b4))) (not (= (y b11) (y b4))))
	(= (x b11) (x b5))
(= (y b11) (y b5))
	(= (x b11) (x b6))
(= (y b11) (y b6))
	(or (not (= (x b11) (x b7))) (not (= (y b11) (y b7))))
	(or (not (= (x b11) (x b8))) (not (= (y b11) (y b8))))
	(or (not (= (x b11) (x b9))) (not (= (y b11) (y b9))))
	(or (not (= (x b11) (x b12))) (not (= (y b11) (y b12))))
	(or (not (= (x b11) (x b13))) (not (= (y b11) (y b13))))
	(or (not (= (x b11) (x b14))) (not (= (y b11) (y b14))))
	(or (not (= (x b11) (x b15))) (not (= (y b11) (y b15))))
	(or (not (= (x b12) (x b2))) (not (= (y b12) (y b2))))
	(or (not (= (x b12) (x b3))) (not (= (y b12) (y b3))))
	(= (x b12) (x b4))
(= (y b12) (y b4))
	(or (not (= (x b12) (x b5))) (not (= (y b12) (y b5))))
	(or (not (= (x b12) (x b6))) (not (= (y b12) (y b6))))
	(= (x b12) (x b7))
(= (y b12) (y b7))
	(= (x b12) (x b8))
(= (y b12) (y b8))
	(or (not (= (x b12) (x b9))) (not (= (y b12) (y b9))))
	(= (x b12) (x b13))
(= (y b12) (y b13))
	(= (x b12) (x b14))
(= (y b12) (y b14))
	(or (not (= (x b12) (x b15))) (not (= (y b12) (y b15))))
	(or (not (= (x b13) (x b2))) (not (= (y b13) (y b2))))
	(or (not (= (x b13) (x b3))) (not (= (y b13) (y b3))))
	(= (x b13) (x b4))
(= (y b13) (y b4))
	(or (not (= (x b13) (x b5))) (not (= (y b13) (y b5))))
	(or (not (= (x b13) (x b6))) (not (= (y b13) (y b6))))
	(= (x b13) (x b7))
(= (y b13) (y b7))
	(= (x b13) (x b8))
(= (y b13) (y b8))
	(or (not (= (x b13) (x b9))) (not (= (y b13) (y b9))))
	(= (x b13) (x b14))
(= (y b13) (y b14))
	(or (not (= (x b13) (x b15))) (not (= (y b13) (y b15))))
	(or (not (= (x b14) (x b2))) (not (= (y b14) (y b2))))
	(or (not (= (x b14) (x b3))) (not (= (y b14) (y b3))))
	(= (x b14) (x b4))
(= (y b14) (y b4))
	(or (not (= (x b14) (x b5))) (not (= (y b14) (y b5))))
	(or (not (= (x b14) (x b6))) (not (= (y b14) (y b6))))
	(= (x b14) (x b7))
(= (y b14) (y b7))
	(= (x b14) (x b8))
(= (y b14) (y b8))
	(or (not (= (x b14) (x b9))) (not (= (y b14) (y b9))))
	(or (not (= (x b14) (x b15))) (not (= (y b14) (y b15))))
	(= (x b15) (x b2))
(= (y b15) (y b2))
	(or (not (= (x b15) (x b3))) (not (= (y b15) (y b3))))
	(or (not (= (x b15) (x b4))) (not (= (y b15) (y b4))))
	(or (not (= (x b15) (x b5))) (not (= (y b15) (y b5))))
	(or (not (= (x b15) (x b6))) (not (= (y b15) (y b6))))
	(or (not (= (x b15) (x b7))) (not (= (y b15) (y b7))))
	(or (not (= (x b15) (x b8))) (not (= (y b15) (y b8))))
	(= (x b15) (x b9))
(= (y b15) (y b9))
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
(at-most-once (and (>= (x b11) 1) (< (x b11) 5)))
(at-most-once (and (>= (y b11) 1) (< (y b11) 5)))
(at-most-once (and (>= (x b12) 1) (< (x b12) 5)))
(at-most-once (and (>= (y b12) 1) (< (y b12) 5)))
(at-most-once (and (>= (x b13) 1) (< (x b13) 5)))
(at-most-once (and (>= (y b13) 1) (< (y b13) 5)))
(at-most-once (and (>= (x b14) 1) (< (x b14) 5)))
(at-most-once (and (>= (y b14) 1) (< (y b14) 5)))
(at-most-once (and (>= (x b15) 1) (< (x b15) 5)))
(at-most-once (and (>= (y b15) 1) (< (y b15) 5)))
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
(at-most-once (and (>= (x b11) 5) (< (x b11) 9)))
(at-most-once (and (>= (y b11) 5) (< (y b11) 9)))
(at-most-once (and (>= (x b12) 5) (< (x b12) 9)))
(at-most-once (and (>= (y b12) 5) (< (y b12) 9)))
(at-most-once (and (>= (x b13) 5) (< (x b13) 9)))
(at-most-once (and (>= (y b13) 5) (< (y b13) 9)))
(at-most-once (and (>= (x b14) 5) (< (x b14) 9)))
(at-most-once (and (>= (y b14) 5) (< (y b14) 9)))
(at-most-once (and (>= (x b15) 5) (< (x b15) 9)))
(at-most-once (and (>= (y b15) 5) (< (y b15) 9)))
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
(at-most-once (and (>= (x b11) 9) (< (x b11) 13)))
(at-most-once (and (>= (y b11) 9) (< (y b11) 13)))
(at-most-once (and (>= (x b12) 9) (< (x b12) 13)))
(at-most-once (and (>= (y b12) 9) (< (y b12) 13)))
(at-most-once (and (>= (x b13) 9) (< (x b13) 13)))
(at-most-once (and (>= (y b13) 9) (< (y b13) 13)))
(at-most-once (and (>= (x b14) 9) (< (x b14) 13)))
(at-most-once (and (>= (y b14) 9) (< (y b14) 13)))
(at-most-once (and (>= (x b15) 9) (< (x b15) 13)))
(at-most-once (and (>= (y b15) 9) (< (y b15) 13)))
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
(at-most-once (and (>= (x b11) 13) (< (x b11) 17)))
(at-most-once (and (>= (y b11) 13) (< (y b11) 17)))
(at-most-once (and (>= (x b12) 13) (< (x b12) 17)))
(at-most-once (and (>= (y b12) 13) (< (y b12) 17)))
(at-most-once (and (>= (x b13) 13) (< (x b13) 17)))
(at-most-once (and (>= (y b13) 13) (< (y b13) 17)))
(at-most-once (and (>= (x b14) 13) (< (x b14) 17)))
(at-most-once (and (>= (y b14) 13) (< (y b14) 17)))
(at-most-once (and (>= (x b15) 13) (< (x b15) 17)))
(at-most-once (and (>= (y b15) 13) (< (y b15) 17)))
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
(at-most-once (and (>= (y b10) 17) (< (y b10) 21)))
(at-most-once (and (>= (x b11) 17) (< (x b11) 21)))
(at-most-once (and (>= (y b11) 17) (< (y b11) 21)))
(at-most-once (and (>= (x b12) 17) (< (x b12) 21)))
(at-most-once (and (>= (y b12) 17) (< (y b12) 21)))
(at-most-once (and (>= (x b13) 17) (< (x b13) 21)))
(at-most-once (and (>= (y b13) 17) (< (y b13) 21)))
(at-most-once (and (>= (x b14) 17) (< (x b14) 21)))
(at-most-once (and (>= (y b14) 17) (< (y b14) 21)))
(at-most-once (and (>= (x b15) 17) (< (x b15) 21)))
(at-most-once (and (>= (y b15) 17) (< (y b15) 21)))))

)