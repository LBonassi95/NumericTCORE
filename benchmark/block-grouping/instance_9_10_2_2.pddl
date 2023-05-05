
(define (problem instance_9_10_2_2)
  (:domain mt-block-grouping)
  (:objects
    b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 - block
  )

  (:init
    (= (x b9) 7)
	(= (y b9) 7)
	(= (x b5) 5)
	(= (y b5) 3)
	(= (x b4) 7)
	(= (y b4) 5)
	(= (x b2) 5)
	(= (y b2) 8)
	(= (x b1) 4)
	(= (y b1) 8)
	(= (x b10) 2)
	(= (y b10) 9)
	(= (x b8) 5)
	(= (y b8) 9)
	(= (x b3) 8)
	(= (y b3) 1)
	(= (x b6) 7)
	(= (y b6) 3)
	(= (x b7) 1)
	(= (y b7) 8)
	(= (max_x) 9 )
	(= (min_x) 1 )
	(= (max_y) 9 )
	(= (min_y) 1 )
  )

  (:goal (and 
    (= (x b1) (x b2))
(= (y b1) (y b2))
	(= (x b1) (x b3))
(= (y b1) (y b3))
	(= (x b1) (x b4))
(= (y b1) (y b4))
	(= (x b1) (x b5))
(= (y b1) (y b5))
	(or (not (= (x b1) (x b6))) (not (= (y b1) (y b6))))
	(= (x b1) (x b7))
(= (y b1) (y b7))
	(= (x b1) (x b8))
(= (y b1) (y b8))
	(or (not (= (x b1) (x b9))) (not (= (y b1) (y b9))))
	(= (x b1) (x b10))
(= (y b1) (y b10))
	(= (x b2) (x b3))
(= (y b2) (y b3))
	(= (x b2) (x b4))
(= (y b2) (y b4))
	(= (x b2) (x b5))
(= (y b2) (y b5))
	(or (not (= (x b2) (x b6))) (not (= (y b2) (y b6))))
	(= (x b2) (x b7))
(= (y b2) (y b7))
	(= (x b2) (x b8))
(= (y b2) (y b8))
	(or (not (= (x b2) (x b9))) (not (= (y b2) (y b9))))
	(= (x b3) (x b4))
(= (y b3) (y b4))
	(= (x b3) (x b5))
(= (y b3) (y b5))
	(or (not (= (x b3) (x b6))) (not (= (y b3) (y b6))))
	(= (x b3) (x b7))
(= (y b3) (y b7))
	(= (x b3) (x b8))
(= (y b3) (y b8))
	(or (not (= (x b3) (x b9))) (not (= (y b3) (y b9))))
	(= (x b4) (x b5))
(= (y b4) (y b5))
	(or (not (= (x b4) (x b6))) (not (= (y b4) (y b6))))
	(= (x b4) (x b7))
(= (y b4) (y b7))
	(= (x b4) (x b8))
(= (y b4) (y b8))
	(or (not (= (x b4) (x b9))) (not (= (y b4) (y b9))))
	(or (not (= (x b5) (x b6))) (not (= (y b5) (y b6))))
	(= (x b5) (x b7))
(= (y b5) (y b7))
	(= (x b5) (x b8))
(= (y b5) (y b8))
	(or (not (= (x b5) (x b9))) (not (= (y b5) (y b9))))
	(or (not (= (x b6) (x b7))) (not (= (y b6) (y b7))))
	(or (not (= (x b6) (x b8))) (not (= (y b6) (y b8))))
	(= (x b6) (x b9))
(= (y b6) (y b9))
	(= (x b7) (x b8))
(= (y b7) (y b8))
	(or (not (= (x b7) (x b9))) (not (= (y b7) (y b9))))
	(or (not (= (x b8) (x b9))) (not (= (y b8) (y b9))))
	(= (x b10) (x b2))
(= (y b10) (y b2))
	(= (x b10) (x b3))
(= (y b10) (y b3))
	(= (x b10) (x b4))
(= (y b10) (y b4))
	(= (x b10) (x b5))
(= (y b10) (y b5))
	(or (not (= (x b10) (x b6))) (not (= (y b10) (y b6))))
	(= (x b10) (x b7))
(= (y b10) (y b7))
	(= (x b10) (x b8))
(= (y b10) (y b8))
	(or (not (= (x b10) (x b9))) (not (= (y b10) (y b9))))
  ))

  
  

  


(:constraints (and (at-most-once (and (>= (x b1) 1) (< (x b1) 3)))
(at-most-once (and (>= (y b1) 1) (< (y b1) 3)))
(at-most-once (and (>= (x b2) 1) (< (x b2) 3)))
(at-most-once (and (>= (y b2) 1) (< (y b2) 3)))
(at-most-once (and (>= (x b3) 1) (< (x b3) 3)))
(at-most-once (and (>= (y b3) 1) (< (y b3) 3)))
(at-most-once (and (>= (x b4) 1) (< (x b4) 3)))
(at-most-once (and (>= (y b4) 1) (< (y b4) 3)))
(at-most-once (and (>= (x b5) 1) (< (x b5) 3)))
(at-most-once (and (>= (y b5) 1) (< (y b5) 3)))
(at-most-once (and (>= (x b6) 1) (< (x b6) 3)))
(at-most-once (and (>= (y b6) 1) (< (y b6) 3)))
(at-most-once (and (>= (x b7) 1) (< (x b7) 3)))
(at-most-once (and (>= (y b7) 1) (< (y b7) 3)))
(at-most-once (and (>= (x b8) 1) (< (x b8) 3)))
(at-most-once (and (>= (y b8) 1) (< (y b8) 3)))
(at-most-once (and (>= (x b9) 1) (< (x b9) 3)))
(at-most-once (and (>= (y b9) 1) (< (y b9) 3)))
(at-most-once (and (>= (x b10) 1) (< (x b10) 3)))
(at-most-once (and (>= (y b10) 1) (< (y b10) 3)))
(at-most-once (and (>= (x b1) 3) (< (x b1) 5)))
(at-most-once (and (>= (y b1) 3) (< (y b1) 5)))
(at-most-once (and (>= (x b2) 3) (< (x b2) 5)))
(at-most-once (and (>= (y b2) 3) (< (y b2) 5)))
(at-most-once (and (>= (x b3) 3) (< (x b3) 5)))
(at-most-once (and (>= (y b3) 3) (< (y b3) 5)))
(at-most-once (and (>= (x b4) 3) (< (x b4) 5)))
(at-most-once (and (>= (y b4) 3) (< (y b4) 5)))
(at-most-once (and (>= (x b5) 3) (< (x b5) 5)))
(at-most-once (and (>= (y b5) 3) (< (y b5) 5)))
(at-most-once (and (>= (x b6) 3) (< (x b6) 5)))
(at-most-once (and (>= (y b6) 3) (< (y b6) 5)))
(at-most-once (and (>= (x b7) 3) (< (x b7) 5)))
(at-most-once (and (>= (y b7) 3) (< (y b7) 5)))
(at-most-once (and (>= (x b8) 3) (< (x b8) 5)))
(at-most-once (and (>= (y b8) 3) (< (y b8) 5)))
(at-most-once (and (>= (x b9) 3) (< (x b9) 5)))
(at-most-once (and (>= (y b9) 3) (< (y b9) 5)))
(at-most-once (and (>= (x b10) 3) (< (x b10) 5)))
(at-most-once (and (>= (y b10) 3) (< (y b10) 5)))
(at-most-once (and (>= (x b1) 5) (< (x b1) 7)))
(at-most-once (and (>= (y b1) 5) (< (y b1) 7)))
(at-most-once (and (>= (x b2) 5) (< (x b2) 7)))
(at-most-once (and (>= (y b2) 5) (< (y b2) 7)))
(at-most-once (and (>= (x b3) 5) (< (x b3) 7)))
(at-most-once (and (>= (y b3) 5) (< (y b3) 7)))
(at-most-once (and (>= (x b4) 5) (< (x b4) 7)))
(at-most-once (and (>= (y b4) 5) (< (y b4) 7)))
(at-most-once (and (>= (x b5) 5) (< (x b5) 7)))
(at-most-once (and (>= (y b5) 5) (< (y b5) 7)))
(at-most-once (and (>= (x b6) 5) (< (x b6) 7)))
(at-most-once (and (>= (y b6) 5) (< (y b6) 7)))
(at-most-once (and (>= (x b7) 5) (< (x b7) 7)))
(at-most-once (and (>= (y b7) 5) (< (y b7) 7)))
(at-most-once (and (>= (x b8) 5) (< (x b8) 7)))
(at-most-once (and (>= (y b8) 5) (< (y b8) 7)))
(at-most-once (and (>= (x b9) 5) (< (x b9) 7)))
(at-most-once (and (>= (y b9) 5) (< (y b9) 7)))
(at-most-once (and (>= (x b10) 5) (< (x b10) 7)))
(at-most-once (and (>= (y b10) 5) (< (y b10) 7)))
(at-most-once (and (>= (x b1) 7) (< (x b1) 10)))
(at-most-once (and (>= (y b1) 7) (< (y b1) 10)))
(at-most-once (and (>= (x b2) 7) (< (x b2) 10)))
(at-most-once (and (>= (y b2) 7) (< (y b2) 10)))
(at-most-once (and (>= (x b3) 7) (< (x b3) 10)))
(at-most-once (and (>= (y b3) 7) (< (y b3) 10)))
(at-most-once (and (>= (x b4) 7) (< (x b4) 10)))
(at-most-once (and (>= (y b4) 7) (< (y b4) 10)))
(at-most-once (and (>= (x b5) 7) (< (x b5) 10)))
(at-most-once (and (>= (y b5) 7) (< (y b5) 10)))
(at-most-once (and (>= (x b6) 7) (< (x b6) 10)))
(at-most-once (and (>= (y b6) 7) (< (y b6) 10)))
(at-most-once (and (>= (x b7) 7) (< (x b7) 10)))
(at-most-once (and (>= (y b7) 7) (< (y b7) 10)))
(at-most-once (and (>= (x b8) 7) (< (x b8) 10)))
(at-most-once (and (>= (y b8) 7) (< (y b8) 10)))
(at-most-once (and (>= (x b9) 7) (< (x b9) 10)))
(at-most-once (and (>= (y b9) 7) (< (y b9) 10)))
(at-most-once (and (>= (x b10) 7) (< (x b10) 10)))
(at-most-once (and (>= (y b10) 7) (< (y b10) 10)))))

)