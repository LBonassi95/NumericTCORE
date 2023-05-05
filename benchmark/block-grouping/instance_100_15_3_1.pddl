
(define (problem instance_100_15_3_1)
  (:domain mt-block-grouping)
  (:objects
    b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 b11 b12 b13 b14 b15 - block
  )

  (:init
    (= (x b5) 30)
	(= (y b5) 15)
	(= (x b4) 44)
	(= (y b4) 38)
	(= (x b2) 95)
	(= (y b2) 81)
	(= (x b3) 19)
	(= (y b3) 65)
	(= (x b8) 99)
	(= (y b8) 18)
	(= (x b14) 36)
	(= (y b14) 49)
	(= (x b9) 77)
	(= (y b9) 29)
	(= (x b15) 94)
	(= (y b15) 71)
	(= (x b10) 42)
	(= (y b10) 22)
	(= (x b1) 44)
	(= (y b1) 92)
	(= (x b12) 91)
	(= (y b12) 50)
	(= (x b11) 5)
	(= (y b11) 92)
	(= (x b6) 83)
	(= (y b6) 4)
	(= (x b7) 10)
	(= (y b7) 61)
	(= (x b13) 89)
	(= (y b13) 51)
	(= (max_x) 100 )
	(= (min_x) 1 )
	(= (max_y) 100 )
	(= (min_y) 1 )
  )

  (:goal (and 
    (= (x b1) (x b2))
(= (y b1) (y b2))
	(= (x b1) (x b3))
(= (y b1) (y b3))
	(or (not (= (x b1) (x b4))) (not (= (y b1) (y b4))))
	(= (x b1) (x b5))
(= (y b1) (y b5))
	(or (not (= (x b1) (x b6))) (not (= (y b1) (y b6))))
	(= (x b1) (x b7))
(= (y b1) (y b7))
	(= (x b1) (x b8))
(= (y b1) (y b8))
	(or (not (= (x b1) (x b9))) (not (= (y b1) (y b9))))
	(or (not (= (x b1) (x b10))) (not (= (y b1) (y b10))))
	(or (not (= (x b1) (x b11))) (not (= (y b1) (y b11))))
	(or (not (= (x b1) (x b12))) (not (= (y b1) (y b12))))
	(= (x b1) (x b13))
(= (y b1) (y b13))
	(= (x b1) (x b14))
(= (y b1) (y b14))
	(or (not (= (x b1) (x b15))) (not (= (y b1) (y b15))))
	(= (x b2) (x b3))
(= (y b2) (y b3))
	(or (not (= (x b2) (x b4))) (not (= (y b2) (y b4))))
	(= (x b2) (x b5))
(= (y b2) (y b5))
	(or (not (= (x b2) (x b6))) (not (= (y b2) (y b6))))
	(= (x b2) (x b7))
(= (y b2) (y b7))
	(= (x b2) (x b8))
(= (y b2) (y b8))
	(or (not (= (x b2) (x b9))) (not (= (y b2) (y b9))))
	(or (not (= (x b3) (x b4))) (not (= (y b3) (y b4))))
	(= (x b3) (x b5))
(= (y b3) (y b5))
	(or (not (= (x b3) (x b6))) (not (= (y b3) (y b6))))
	(= (x b3) (x b7))
(= (y b3) (y b7))
	(= (x b3) (x b8))
(= (y b3) (y b8))
	(or (not (= (x b3) (x b9))) (not (= (y b3) (y b9))))
	(or (not (= (x b4) (x b5))) (not (= (y b4) (y b5))))
	(= (x b4) (x b6))
(= (y b4) (y b6))
	(or (not (= (x b4) (x b7))) (not (= (y b4) (y b7))))
	(or (not (= (x b4) (x b8))) (not (= (y b4) (y b8))))
	(or (not (= (x b4) (x b9))) (not (= (y b4) (y b9))))
	(or (not (= (x b5) (x b6))) (not (= (y b5) (y b6))))
	(= (x b5) (x b7))
(= (y b5) (y b7))
	(= (x b5) (x b8))
(= (y b5) (y b8))
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
	(or (not (= (x b10) (x b4))) (not (= (y b10) (y b4))))
	(or (not (= (x b10) (x b5))) (not (= (y b10) (y b5))))
	(or (not (= (x b10) (x b6))) (not (= (y b10) (y b6))))
	(or (not (= (x b10) (x b7))) (not (= (y b10) (y b7))))
	(or (not (= (x b10) (x b8))) (not (= (y b10) (y b8))))
	(= (x b10) (x b9))
(= (y b10) (y b9))
	(or (not (= (x b10) (x b11))) (not (= (y b10) (y b11))))
	(or (not (= (x b10) (x b12))) (not (= (y b10) (y b12))))
	(or (not (= (x b10) (x b13))) (not (= (y b10) (y b13))))
	(or (not (= (x b10) (x b14))) (not (= (y b10) (y b14))))
	(= (x b10) (x b15))
(= (y b10) (y b15))
	(or (not (= (x b11) (x b2))) (not (= (y b11) (y b2))))
	(or (not (= (x b11) (x b3))) (not (= (y b11) (y b3))))
	(= (x b11) (x b4))
(= (y b11) (y b4))
	(or (not (= (x b11) (x b5))) (not (= (y b11) (y b5))))
	(= (x b11) (x b6))
(= (y b11) (y b6))
	(or (not (= (x b11) (x b7))) (not (= (y b11) (y b7))))
	(or (not (= (x b11) (x b8))) (not (= (y b11) (y b8))))
	(or (not (= (x b11) (x b9))) (not (= (y b11) (y b9))))
	(= (x b11) (x b12))
(= (y b11) (y b12))
	(or (not (= (x b11) (x b13))) (not (= (y b11) (y b13))))
	(or (not (= (x b11) (x b14))) (not (= (y b11) (y b14))))
	(or (not (= (x b11) (x b15))) (not (= (y b11) (y b15))))
	(or (not (= (x b12) (x b2))) (not (= (y b12) (y b2))))
	(or (not (= (x b12) (x b3))) (not (= (y b12) (y b3))))
	(= (x b12) (x b4))
(= (y b12) (y b4))
	(or (not (= (x b12) (x b5))) (not (= (y b12) (y b5))))
	(= (x b12) (x b6))
(= (y b12) (y b6))
	(or (not (= (x b12) (x b7))) (not (= (y b12) (y b7))))
	(or (not (= (x b12) (x b8))) (not (= (y b12) (y b8))))
	(or (not (= (x b12) (x b9))) (not (= (y b12) (y b9))))
	(or (not (= (x b12) (x b13))) (not (= (y b12) (y b13))))
	(or (not (= (x b12) (x b14))) (not (= (y b12) (y b14))))
	(or (not (= (x b12) (x b15))) (not (= (y b12) (y b15))))
	(= (x b13) (x b2))
(= (y b13) (y b2))
	(= (x b13) (x b3))
(= (y b13) (y b3))
	(or (not (= (x b13) (x b4))) (not (= (y b13) (y b4))))
	(= (x b13) (x b5))
(= (y b13) (y b5))
	(or (not (= (x b13) (x b6))) (not (= (y b13) (y b6))))
	(= (x b13) (x b7))
(= (y b13) (y b7))
	(= (x b13) (x b8))
(= (y b13) (y b8))
	(or (not (= (x b13) (x b9))) (not (= (y b13) (y b9))))
	(= (x b13) (x b14))
(= (y b13) (y b14))
	(or (not (= (x b13) (x b15))) (not (= (y b13) (y b15))))
	(= (x b14) (x b2))
(= (y b14) (y b2))
	(= (x b14) (x b3))
(= (y b14) (y b3))
	(or (not (= (x b14) (x b4))) (not (= (y b14) (y b4))))
	(= (x b14) (x b5))
(= (y b14) (y b5))
	(or (not (= (x b14) (x b6))) (not (= (y b14) (y b6))))
	(= (x b14) (x b7))
(= (y b14) (y b7))
	(= (x b14) (x b8))
(= (y b14) (y b8))
	(or (not (= (x b14) (x b9))) (not (= (y b14) (y b9))))
	(or (not (= (x b14) (x b15))) (not (= (y b14) (y b15))))
	(or (not (= (x b15) (x b2))) (not (= (y b15) (y b2))))
	(or (not (= (x b15) (x b3))) (not (= (y b15) (y b3))))
	(or (not (= (x b15) (x b4))) (not (= (y b15) (y b4))))
	(or (not (= (x b15) (x b5))) (not (= (y b15) (y b5))))
	(or (not (= (x b15) (x b6))) (not (= (y b15) (y b6))))
	(or (not (= (x b15) (x b7))) (not (= (y b15) (y b7))))
	(or (not (= (x b15) (x b8))) (not (= (y b15) (y b8))))
	(= (x b15) (x b9))
(= (y b15) (y b9))
  ))

  
  

  


(:constraints (and (at-most-once (and (>= (x b1) 1) (< (x b1) 10)))
(at-most-once (and (>= (y b1) 1) (< (y b1) 10)))
(at-most-once (and (>= (x b2) 1) (< (x b2) 10)))
(at-most-once (and (>= (y b2) 1) (< (y b2) 10)))
(at-most-once (and (>= (x b3) 1) (< (x b3) 10)))
(at-most-once (and (>= (y b3) 1) (< (y b3) 10)))
(at-most-once (and (>= (x b4) 1) (< (x b4) 10)))
(at-most-once (and (>= (y b4) 1) (< (y b4) 10)))
(at-most-once (and (>= (x b5) 1) (< (x b5) 10)))
(at-most-once (and (>= (y b5) 1) (< (y b5) 10)))
(at-most-once (and (>= (x b6) 1) (< (x b6) 10)))
(at-most-once (and (>= (y b6) 1) (< (y b6) 10)))
(at-most-once (and (>= (x b7) 1) (< (x b7) 10)))
(at-most-once (and (>= (y b7) 1) (< (y b7) 10)))
(at-most-once (and (>= (x b8) 1) (< (x b8) 10)))
(at-most-once (and (>= (y b8) 1) (< (y b8) 10)))
(at-most-once (and (>= (x b9) 1) (< (x b9) 10)))
(at-most-once (and (>= (y b9) 1) (< (y b9) 10)))
(at-most-once (and (>= (x b10) 1) (< (x b10) 10)))
(at-most-once (and (>= (y b10) 1) (< (y b10) 10)))
(at-most-once (and (>= (x b11) 1) (< (x b11) 10)))
(at-most-once (and (>= (y b11) 1) (< (y b11) 10)))
(at-most-once (and (>= (x b12) 1) (< (x b12) 10)))
(at-most-once (and (>= (y b12) 1) (< (y b12) 10)))
(at-most-once (and (>= (x b13) 1) (< (x b13) 10)))
(at-most-once (and (>= (y b13) 1) (< (y b13) 10)))
(at-most-once (and (>= (x b14) 1) (< (x b14) 10)))
(at-most-once (and (>= (y b14) 1) (< (y b14) 10)))
(at-most-once (and (>= (x b15) 1) (< (x b15) 10)))
(at-most-once (and (>= (y b15) 1) (< (y b15) 10)))
(at-most-once (and (>= (x b1) 10) (< (x b1) 19)))
(at-most-once (and (>= (y b1) 10) (< (y b1) 19)))
(at-most-once (and (>= (x b2) 10) (< (x b2) 19)))
(at-most-once (and (>= (y b2) 10) (< (y b2) 19)))
(at-most-once (and (>= (x b3) 10) (< (x b3) 19)))
(at-most-once (and (>= (y b3) 10) (< (y b3) 19)))
(at-most-once (and (>= (x b4) 10) (< (x b4) 19)))
(at-most-once (and (>= (y b4) 10) (< (y b4) 19)))
(at-most-once (and (>= (x b5) 10) (< (x b5) 19)))
(at-most-once (and (>= (y b5) 10) (< (y b5) 19)))
(at-most-once (and (>= (x b6) 10) (< (x b6) 19)))
(at-most-once (and (>= (y b6) 10) (< (y b6) 19)))
(at-most-once (and (>= (x b7) 10) (< (x b7) 19)))
(at-most-once (and (>= (y b7) 10) (< (y b7) 19)))
(at-most-once (and (>= (x b8) 10) (< (x b8) 19)))
(at-most-once (and (>= (y b8) 10) (< (y b8) 19)))
(at-most-once (and (>= (x b9) 10) (< (x b9) 19)))
(at-most-once (and (>= (y b9) 10) (< (y b9) 19)))
(at-most-once (and (>= (x b10) 10) (< (x b10) 19)))
(at-most-once (and (>= (y b10) 10) (< (y b10) 19)))
(at-most-once (and (>= (x b11) 10) (< (x b11) 19)))
(at-most-once (and (>= (y b11) 10) (< (y b11) 19)))
(at-most-once (and (>= (x b12) 10) (< (x b12) 19)))
(at-most-once (and (>= (y b12) 10) (< (y b12) 19)))
(at-most-once (and (>= (x b13) 10) (< (x b13) 19)))
(at-most-once (and (>= (y b13) 10) (< (y b13) 19)))
(at-most-once (and (>= (x b14) 10) (< (x b14) 19)))
(at-most-once (and (>= (y b14) 10) (< (y b14) 19)))
(at-most-once (and (>= (x b15) 10) (< (x b15) 19)))
(at-most-once (and (>= (y b15) 10) (< (y b15) 19)))
(at-most-once (and (>= (x b1) 19) (< (x b1) 28)))
(at-most-once (and (>= (y b1) 19) (< (y b1) 28)))
(at-most-once (and (>= (x b2) 19) (< (x b2) 28)))
(at-most-once (and (>= (y b2) 19) (< (y b2) 28)))
(at-most-once (and (>= (x b3) 19) (< (x b3) 28)))
(at-most-once (and (>= (y b3) 19) (< (y b3) 28)))
(at-most-once (and (>= (x b4) 19) (< (x b4) 28)))
(at-most-once (and (>= (y b4) 19) (< (y b4) 28)))
(at-most-once (and (>= (x b5) 19) (< (x b5) 28)))
(at-most-once (and (>= (y b5) 19) (< (y b5) 28)))
(at-most-once (and (>= (x b6) 19) (< (x b6) 28)))
(at-most-once (and (>= (y b6) 19) (< (y b6) 28)))
(at-most-once (and (>= (x b7) 19) (< (x b7) 28)))
(at-most-once (and (>= (y b7) 19) (< (y b7) 28)))
(at-most-once (and (>= (x b8) 19) (< (x b8) 28)))
(at-most-once (and (>= (y b8) 19) (< (y b8) 28)))
(at-most-once (and (>= (x b9) 19) (< (x b9) 28)))
(at-most-once (and (>= (y b9) 19) (< (y b9) 28)))
(at-most-once (and (>= (x b10) 19) (< (x b10) 28)))
(at-most-once (and (>= (y b10) 19) (< (y b10) 28)))
(at-most-once (and (>= (x b11) 19) (< (x b11) 28)))
(at-most-once (and (>= (y b11) 19) (< (y b11) 28)))
(at-most-once (and (>= (x b12) 19) (< (x b12) 28)))
(at-most-once (and (>= (y b12) 19) (< (y b12) 28)))
(at-most-once (and (>= (x b13) 19) (< (x b13) 28)))
(at-most-once (and (>= (y b13) 19) (< (y b13) 28)))
(at-most-once (and (>= (x b14) 19) (< (x b14) 28)))
(at-most-once (and (>= (y b14) 19) (< (y b14) 28)))
(at-most-once (and (>= (x b15) 19) (< (x b15) 28)))
(at-most-once (and (>= (y b15) 19) (< (y b15) 28)))
(at-most-once (and (>= (x b1) 28) (< (x b1) 37)))
(at-most-once (and (>= (y b1) 28) (< (y b1) 37)))
(at-most-once (and (>= (x b2) 28) (< (x b2) 37)))
(at-most-once (and (>= (y b2) 28) (< (y b2) 37)))
(at-most-once (and (>= (x b3) 28) (< (x b3) 37)))
(at-most-once (and (>= (y b3) 28) (< (y b3) 37)))
(at-most-once (and (>= (x b4) 28) (< (x b4) 37)))
(at-most-once (and (>= (y b4) 28) (< (y b4) 37)))
(at-most-once (and (>= (x b5) 28) (< (x b5) 37)))
(at-most-once (and (>= (y b5) 28) (< (y b5) 37)))
(at-most-once (and (>= (x b6) 28) (< (x b6) 37)))
(at-most-once (and (>= (y b6) 28) (< (y b6) 37)))
(at-most-once (and (>= (x b7) 28) (< (x b7) 37)))
(at-most-once (and (>= (y b7) 28) (< (y b7) 37)))
(at-most-once (and (>= (x b8) 28) (< (x b8) 37)))
(at-most-once (and (>= (y b8) 28) (< (y b8) 37)))
(at-most-once (and (>= (x b9) 28) (< (x b9) 37)))
(at-most-once (and (>= (y b9) 28) (< (y b9) 37)))
(at-most-once (and (>= (x b10) 28) (< (x b10) 37)))
(at-most-once (and (>= (y b10) 28) (< (y b10) 37)))
(at-most-once (and (>= (x b11) 28) (< (x b11) 37)))
(at-most-once (and (>= (y b11) 28) (< (y b11) 37)))
(at-most-once (and (>= (x b12) 28) (< (x b12) 37)))
(at-most-once (and (>= (y b12) 28) (< (y b12) 37)))
(at-most-once (and (>= (x b13) 28) (< (x b13) 37)))
(at-most-once (and (>= (y b13) 28) (< (y b13) 37)))
(at-most-once (and (>= (x b14) 28) (< (x b14) 37)))
(at-most-once (and (>= (y b14) 28) (< (y b14) 37)))
(at-most-once (and (>= (x b15) 28) (< (x b15) 37)))
(at-most-once (and (>= (y b15) 28) (< (y b15) 37)))
(at-most-once (and (>= (x b1) 37) (< (x b1) 46)))
(at-most-once (and (>= (y b1) 37) (< (y b1) 46)))
(at-most-once (and (>= (x b2) 37) (< (x b2) 46)))
(at-most-once (and (>= (y b2) 37) (< (y b2) 46)))
(at-most-once (and (>= (x b3) 37) (< (x b3) 46)))
(at-most-once (and (>= (y b3) 37) (< (y b3) 46)))
(at-most-once (and (>= (x b4) 37) (< (x b4) 46)))
(at-most-once (and (>= (y b4) 37) (< (y b4) 46)))
(at-most-once (and (>= (x b5) 37) (< (x b5) 46)))
(at-most-once (and (>= (y b5) 37) (< (y b5) 46)))
(at-most-once (and (>= (x b6) 37) (< (x b6) 46)))
(at-most-once (and (>= (y b6) 37) (< (y b6) 46)))
(at-most-once (and (>= (x b7) 37) (< (x b7) 46)))
(at-most-once (and (>= (y b7) 37) (< (y b7) 46)))
(at-most-once (and (>= (x b8) 37) (< (x b8) 46)))
(at-most-once (and (>= (y b8) 37) (< (y b8) 46)))
(at-most-once (and (>= (x b9) 37) (< (x b9) 46)))
(at-most-once (and (>= (y b9) 37) (< (y b9) 46)))
(at-most-once (and (>= (x b10) 37) (< (x b10) 46)))
(at-most-once (and (>= (y b10) 37) (< (y b10) 46)))
(at-most-once (and (>= (x b11) 37) (< (x b11) 46)))
(at-most-once (and (>= (y b11) 37) (< (y b11) 46)))
(at-most-once (and (>= (x b12) 37) (< (x b12) 46)))
(at-most-once (and (>= (y b12) 37) (< (y b12) 46)))
(at-most-once (and (>= (x b13) 37) (< (x b13) 46)))
(at-most-once (and (>= (y b13) 37) (< (y b13) 46)))
(at-most-once (and (>= (x b14) 37) (< (x b14) 46)))
(at-most-once (and (>= (y b14) 37) (< (y b14) 46)))
(at-most-once (and (>= (x b15) 37) (< (x b15) 46)))
(at-most-once (and (>= (y b15) 37) (< (y b15) 46)))
(at-most-once (and (>= (x b1) 46) (< (x b1) 55)))
(at-most-once (and (>= (y b1) 46) (< (y b1) 55)))
(at-most-once (and (>= (x b2) 46) (< (x b2) 55)))
(at-most-once (and (>= (y b2) 46) (< (y b2) 55)))
(at-most-once (and (>= (x b3) 46) (< (x b3) 55)))
(at-most-once (and (>= (y b3) 46) (< (y b3) 55)))
(at-most-once (and (>= (x b4) 46) (< (x b4) 55)))
(at-most-once (and (>= (y b4) 46) (< (y b4) 55)))
(at-most-once (and (>= (x b5) 46) (< (x b5) 55)))
(at-most-once (and (>= (y b5) 46) (< (y b5) 55)))
(at-most-once (and (>= (x b6) 46) (< (x b6) 55)))
(at-most-once (and (>= (y b6) 46) (< (y b6) 55)))
(at-most-once (and (>= (x b7) 46) (< (x b7) 55)))
(at-most-once (and (>= (y b7) 46) (< (y b7) 55)))
(at-most-once (and (>= (x b8) 46) (< (x b8) 55)))
(at-most-once (and (>= (y b8) 46) (< (y b8) 55)))
(at-most-once (and (>= (x b9) 46) (< (x b9) 55)))
(at-most-once (and (>= (y b9) 46) (< (y b9) 55)))
(at-most-once (and (>= (x b10) 46) (< (x b10) 55)))
(at-most-once (and (>= (y b10) 46) (< (y b10) 55)))
(at-most-once (and (>= (x b11) 46) (< (x b11) 55)))
(at-most-once (and (>= (y b11) 46) (< (y b11) 55)))
(at-most-once (and (>= (x b12) 46) (< (x b12) 55)))
(at-most-once (and (>= (y b12) 46) (< (y b12) 55)))
(at-most-once (and (>= (x b13) 46) (< (x b13) 55)))
(at-most-once (and (>= (y b13) 46) (< (y b13) 55)))
(at-most-once (and (>= (x b14) 46) (< (x b14) 55)))
(at-most-once (and (>= (y b14) 46) (< (y b14) 55)))
(at-most-once (and (>= (x b15) 46) (< (x b15) 55)))
(at-most-once (and (>= (y b15) 46) (< (y b15) 55)))
(at-most-once (and (>= (x b1) 55) (< (x b1) 64)))
(at-most-once (and (>= (y b1) 55) (< (y b1) 64)))
(at-most-once (and (>= (x b2) 55) (< (x b2) 64)))
(at-most-once (and (>= (y b2) 55) (< (y b2) 64)))
(at-most-once (and (>= (x b3) 55) (< (x b3) 64)))
(at-most-once (and (>= (y b3) 55) (< (y b3) 64)))
(at-most-once (and (>= (x b4) 55) (< (x b4) 64)))
(at-most-once (and (>= (y b4) 55) (< (y b4) 64)))
(at-most-once (and (>= (x b5) 55) (< (x b5) 64)))
(at-most-once (and (>= (y b5) 55) (< (y b5) 64)))
(at-most-once (and (>= (x b6) 55) (< (x b6) 64)))
(at-most-once (and (>= (y b6) 55) (< (y b6) 64)))
(at-most-once (and (>= (x b7) 55) (< (x b7) 64)))
(at-most-once (and (>= (y b7) 55) (< (y b7) 64)))
(at-most-once (and (>= (x b8) 55) (< (x b8) 64)))
(at-most-once (and (>= (y b8) 55) (< (y b8) 64)))
(at-most-once (and (>= (x b9) 55) (< (x b9) 64)))
(at-most-once (and (>= (y b9) 55) (< (y b9) 64)))
(at-most-once (and (>= (x b10) 55) (< (x b10) 64)))
(at-most-once (and (>= (y b10) 55) (< (y b10) 64)))
(at-most-once (and (>= (x b11) 55) (< (x b11) 64)))
(at-most-once (and (>= (y b11) 55) (< (y b11) 64)))
(at-most-once (and (>= (x b12) 55) (< (x b12) 64)))
(at-most-once (and (>= (y b12) 55) (< (y b12) 64)))
(at-most-once (and (>= (x b13) 55) (< (x b13) 64)))
(at-most-once (and (>= (y b13) 55) (< (y b13) 64)))
(at-most-once (and (>= (x b14) 55) (< (x b14) 64)))
(at-most-once (and (>= (y b14) 55) (< (y b14) 64)))
(at-most-once (and (>= (x b15) 55) (< (x b15) 64)))
(at-most-once (and (>= (y b15) 55) (< (y b15) 64)))
(at-most-once (and (>= (x b1) 64) (< (x b1) 73)))
(at-most-once (and (>= (y b1) 64) (< (y b1) 73)))
(at-most-once (and (>= (x b2) 64) (< (x b2) 73)))
(at-most-once (and (>= (y b2) 64) (< (y b2) 73)))
(at-most-once (and (>= (x b3) 64) (< (x b3) 73)))
(at-most-once (and (>= (y b3) 64) (< (y b3) 73)))
(at-most-once (and (>= (x b4) 64) (< (x b4) 73)))
(at-most-once (and (>= (y b4) 64) (< (y b4) 73)))
(at-most-once (and (>= (x b5) 64) (< (x b5) 73)))
(at-most-once (and (>= (y b5) 64) (< (y b5) 73)))
(at-most-once (and (>= (x b6) 64) (< (x b6) 73)))
(at-most-once (and (>= (y b6) 64) (< (y b6) 73)))
(at-most-once (and (>= (x b7) 64) (< (x b7) 73)))
(at-most-once (and (>= (y b7) 64) (< (y b7) 73)))
(at-most-once (and (>= (x b8) 64) (< (x b8) 73)))
(at-most-once (and (>= (y b8) 64) (< (y b8) 73)))
(at-most-once (and (>= (x b9) 64) (< (x b9) 73)))
(at-most-once (and (>= (y b9) 64) (< (y b9) 73)))
(at-most-once (and (>= (x b10) 64) (< (x b10) 73)))
(at-most-once (and (>= (y b10) 64) (< (y b10) 73)))
(at-most-once (and (>= (x b11) 64) (< (x b11) 73)))
(at-most-once (and (>= (y b11) 64) (< (y b11) 73)))
(at-most-once (and (>= (x b12) 64) (< (x b12) 73)))
(at-most-once (and (>= (y b12) 64) (< (y b12) 73)))
(at-most-once (and (>= (x b13) 64) (< (x b13) 73)))
(at-most-once (and (>= (y b13) 64) (< (y b13) 73)))
(at-most-once (and (>= (x b14) 64) (< (x b14) 73)))
(at-most-once (and (>= (y b14) 64) (< (y b14) 73)))
(at-most-once (and (>= (x b15) 64) (< (x b15) 73)))
(at-most-once (and (>= (y b15) 64) (< (y b15) 73)))
(at-most-once (and (>= (x b1) 73) (< (x b1) 82)))
(at-most-once (and (>= (y b1) 73) (< (y b1) 82)))
(at-most-once (and (>= (x b2) 73) (< (x b2) 82)))
(at-most-once (and (>= (y b2) 73) (< (y b2) 82)))
(at-most-once (and (>= (x b3) 73) (< (x b3) 82)))
(at-most-once (and (>= (y b3) 73) (< (y b3) 82)))
(at-most-once (and (>= (x b4) 73) (< (x b4) 82)))
(at-most-once (and (>= (y b4) 73) (< (y b4) 82)))
(at-most-once (and (>= (x b5) 73) (< (x b5) 82)))
(at-most-once (and (>= (y b5) 73) (< (y b5) 82)))
(at-most-once (and (>= (x b6) 73) (< (x b6) 82)))
(at-most-once (and (>= (y b6) 73) (< (y b6) 82)))
(at-most-once (and (>= (x b7) 73) (< (x b7) 82)))
(at-most-once (and (>= (y b7) 73) (< (y b7) 82)))
(at-most-once (and (>= (x b8) 73) (< (x b8) 82)))
(at-most-once (and (>= (y b8) 73) (< (y b8) 82)))
(at-most-once (and (>= (x b9) 73) (< (x b9) 82)))
(at-most-once (and (>= (y b9) 73) (< (y b9) 82)))
(at-most-once (and (>= (x b10) 73) (< (x b10) 82)))
(at-most-once (and (>= (y b10) 73) (< (y b10) 82)))
(at-most-once (and (>= (x b11) 73) (< (x b11) 82)))
(at-most-once (and (>= (y b11) 73) (< (y b11) 82)))
(at-most-once (and (>= (x b12) 73) (< (x b12) 82)))
(at-most-once (and (>= (y b12) 73) (< (y b12) 82)))
(at-most-once (and (>= (x b13) 73) (< (x b13) 82)))
(at-most-once (and (>= (y b13) 73) (< (y b13) 82)))
(at-most-once (and (>= (x b14) 73) (< (x b14) 82)))
(at-most-once (and (>= (y b14) 73) (< (y b14) 82)))
(at-most-once (and (>= (x b15) 73) (< (x b15) 82)))
(at-most-once (and (>= (y b15) 73) (< (y b15) 82)))
(at-most-once (and (>= (x b1) 82) (< (x b1) 91)))
(at-most-once (and (>= (y b1) 82) (< (y b1) 91)))
(at-most-once (and (>= (x b2) 82) (< (x b2) 91)))
(at-most-once (and (>= (y b2) 82) (< (y b2) 91)))
(at-most-once (and (>= (x b3) 82) (< (x b3) 91)))
(at-most-once (and (>= (y b3) 82) (< (y b3) 91)))
(at-most-once (and (>= (x b4) 82) (< (x b4) 91)))
(at-most-once (and (>= (y b4) 82) (< (y b4) 91)))
(at-most-once (and (>= (x b5) 82) (< (x b5) 91)))
(at-most-once (and (>= (y b5) 82) (< (y b5) 91)))
(at-most-once (and (>= (x b6) 82) (< (x b6) 91)))
(at-most-once (and (>= (y b6) 82) (< (y b6) 91)))
(at-most-once (and (>= (x b7) 82) (< (x b7) 91)))
(at-most-once (and (>= (y b7) 82) (< (y b7) 91)))
(at-most-once (and (>= (x b8) 82) (< (x b8) 91)))
(at-most-once (and (>= (y b8) 82) (< (y b8) 91)))
(at-most-once (and (>= (x b9) 82) (< (x b9) 91)))
(at-most-once (and (>= (y b9) 82) (< (y b9) 91)))
(at-most-once (and (>= (x b10) 82) (< (x b10) 91)))
(at-most-once (and (>= (y b10) 82) (< (y b10) 91)))
(at-most-once (and (>= (x b11) 82) (< (x b11) 91)))
(at-most-once (and (>= (y b11) 82) (< (y b11) 91)))
(at-most-once (and (>= (x b12) 82) (< (x b12) 91)))
(at-most-once (and (>= (y b12) 82) (< (y b12) 91)))
(at-most-once (and (>= (x b13) 82) (< (x b13) 91)))
(at-most-once (and (>= (y b13) 82) (< (y b13) 91)))
(at-most-once (and (>= (x b14) 82) (< (x b14) 91)))
(at-most-once (and (>= (y b14) 82) (< (y b14) 91)))
(at-most-once (and (>= (x b15) 82) (< (x b15) 91)))
(at-most-once (and (>= (y b15) 82) (< (y b15) 91)))
(at-most-once (and (>= (x b1) 91) (< (x b1) 101)))
(at-most-once (and (>= (y b1) 91) (< (y b1) 101)))
(at-most-once (and (>= (x b2) 91) (< (x b2) 101)))
(at-most-once (and (>= (y b2) 91) (< (y b2) 101)))
(at-most-once (and (>= (x b3) 91) (< (x b3) 101)))
(at-most-once (and (>= (y b3) 91) (< (y b3) 101)))
(at-most-once (and (>= (x b4) 91) (< (x b4) 101)))
(at-most-once (and (>= (y b4) 91) (< (y b4) 101)))
(at-most-once (and (>= (x b5) 91) (< (x b5) 101)))
(at-most-once (and (>= (y b5) 91) (< (y b5) 101)))
(at-most-once (and (>= (x b6) 91) (< (x b6) 101)))
(at-most-once (and (>= (y b6) 91) (< (y b6) 101)))
(at-most-once (and (>= (x b7) 91) (< (x b7) 101)))
(at-most-once (and (>= (y b7) 91) (< (y b7) 101)))
(at-most-once (and (>= (x b8) 91) (< (x b8) 101)))
(at-most-once (and (>= (y b8) 91) (< (y b8) 101)))
(at-most-once (and (>= (x b9) 91) (< (x b9) 101)))
(at-most-once (and (>= (y b9) 91) (< (y b9) 101)))
(at-most-once (and (>= (x b10) 91) (< (x b10) 101)))
(at-most-once (and (>= (y b10) 91) (< (y b10) 101)))
(at-most-once (and (>= (x b11) 91) (< (x b11) 101)))
(at-most-once (and (>= (y b11) 91) (< (y b11) 101)))
(at-most-once (and (>= (x b12) 91) (< (x b12) 101)))
(at-most-once (and (>= (y b12) 91) (< (y b12) 101)))
(at-most-once (and (>= (x b13) 91) (< (x b13) 101)))
(at-most-once (and (>= (y b13) 91) (< (y b13) 101)))
(at-most-once (and (>= (x b14) 91) (< (x b14) 101)))
(at-most-once (and (>= (y b14) 91) (< (y b14) 101)))
(at-most-once (and (>= (x b15) 91) (< (x b15) 101)))
(at-most-once (and (>= (y b15) 91) (< (y b15) 101)))))

)