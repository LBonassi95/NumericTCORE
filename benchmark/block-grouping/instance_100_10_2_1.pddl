
(define (problem instance_100_10_2_1)
  (:domain mt-block-grouping)
  (:objects
    b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 - block
  )

  (:init
    (= (x b9) 73)
	(= (y b9) 91)
	(= (x b5) 18)
	(= (y b5) 100)
	(= (x b4) 22)
	(= (y b4) 28)
	(= (x b2) 62)
	(= (y b2) 22)
	(= (x b1) 29)
	(= (y b1) 73)
	(= (x b10) 6)
	(= (y b10) 58)
	(= (x b8) 36)
	(= (y b8) 51)
	(= (x b3) 27)
	(= (y b3) 83)
	(= (x b6) 89)
	(= (y b6) 69)
	(= (x b7) 60)
	(= (y b7) 87)
	(= (max_x) 100 )
	(= (min_x) 1 )
	(= (max_y) 100 )
	(= (min_y) 1 )
  )

  (:goal (and 
    (or (not (= (x b1) (x b2))) (not (= (y b1) (y b2))))
	(or (not (= (x b1) (x b3))) (not (= (y b1) (y b3))))
	(or (not (= (x b1) (x b4))) (not (= (y b1) (y b4))))
	(or (not (= (x b1) (x b5))) (not (= (y b1) (y b5))))
	(or (not (= (x b1) (x b6))) (not (= (y b1) (y b6))))
	(= (x b1) (x b7))
(= (y b1) (y b7))
	(= (x b1) (x b8))
(= (y b1) (y b8))
	(= (x b1) (x b9))
(= (y b1) (y b9))
	(= (x b1) (x b10))
(= (y b1) (y b10))
	(= (x b2) (x b3))
(= (y b2) (y b3))
	(= (x b2) (x b4))
(= (y b2) (y b4))
	(= (x b2) (x b5))
(= (y b2) (y b5))
	(= (x b2) (x b6))
(= (y b2) (y b6))
	(or (not (= (x b2) (x b7))) (not (= (y b2) (y b7))))
	(or (not (= (x b2) (x b8))) (not (= (y b2) (y b8))))
	(or (not (= (x b2) (x b9))) (not (= (y b2) (y b9))))
	(= (x b3) (x b4))
(= (y b3) (y b4))
	(= (x b3) (x b5))
(= (y b3) (y b5))
	(= (x b3) (x b6))
(= (y b3) (y b6))
	(or (not (= (x b3) (x b7))) (not (= (y b3) (y b7))))
	(or (not (= (x b3) (x b8))) (not (= (y b3) (y b8))))
	(or (not (= (x b3) (x b9))) (not (= (y b3) (y b9))))
	(= (x b4) (x b5))
(= (y b4) (y b5))
	(= (x b4) (x b6))
(= (y b4) (y b6))
	(or (not (= (x b4) (x b7))) (not (= (y b4) (y b7))))
	(or (not (= (x b4) (x b8))) (not (= (y b4) (y b8))))
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
	(= (x b7) (x b9))
(= (y b7) (y b9))
	(= (x b8) (x b9))
(= (y b8) (y b9))
	(or (not (= (x b10) (x b2))) (not (= (y b10) (y b2))))
	(or (not (= (x b10) (x b3))) (not (= (y b10) (y b3))))
	(or (not (= (x b10) (x b4))) (not (= (y b10) (y b4))))
	(or (not (= (x b10) (x b5))) (not (= (y b10) (y b5))))
	(or (not (= (x b10) (x b6))) (not (= (y b10) (y b6))))
	(= (x b10) (x b7))
(= (y b10) (y b7))
	(= (x b10) (x b8))
(= (y b10) (y b8))
	(= (x b10) (x b9))
(= (y b10) (y b9))
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
(at-most-once (and (>= (y b10) 91) (< (y b10) 101)))))

)