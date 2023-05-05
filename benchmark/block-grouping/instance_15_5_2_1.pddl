
(define (problem instance_15_5_2_1)
  (:domain mt-block-grouping)
  (:objects
    b1 b2 b3 b4 b5 - block
  )

  (:init
    (= (x b3) 1)
	(= (y b3) 2)
	(= (x b4) 10)
	(= (y b4) 10)
	(= (x b2) 13)
	(= (y b2) 3)
	(= (x b1) 13)
	(= (y b1) 10)
	(= (x b5) 13)
	(= (y b5) 10)
	(= (max_x) 15 )
	(= (min_x) 1 )
	(= (max_y) 15 )
	(= (min_y) 1 )
  )

  (:goal (and 
    (= (x b1) (x b2))
(= (y b1) (y b2))
	(or (not (= (x b1) (x b3))) (not (= (y b1) (y b3))))
	(= (x b1) (x b4))
(= (y b1) (y b4))
	(= (x b1) (x b5))
(= (y b1) (y b5))
	(or (not (= (x b2) (x b3))) (not (= (y b2) (y b3))))
	(= (x b2) (x b4))
(= (y b2) (y b4))
	(= (x b2) (x b5))
(= (y b2) (y b5))
	(or (not (= (x b3) (x b4))) (not (= (y b3) (y b4))))
	(or (not (= (x b3) (x b5))) (not (= (y b3) (y b5))))
	(= (x b4) (x b5))
(= (y b4) (y b5))
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
(at-most-once (and (>= (x b1) 7) (< (x b1) 9)))
(at-most-once (and (>= (y b1) 7) (< (y b1) 9)))
(at-most-once (and (>= (x b2) 7) (< (x b2) 9)))
(at-most-once (and (>= (y b2) 7) (< (y b2) 9)))
(at-most-once (and (>= (x b3) 7) (< (x b3) 9)))
(at-most-once (and (>= (y b3) 7) (< (y b3) 9)))
(at-most-once (and (>= (x b4) 7) (< (x b4) 9)))
(at-most-once (and (>= (y b4) 7) (< (y b4) 9)))
(at-most-once (and (>= (x b5) 7) (< (x b5) 9)))
(at-most-once (and (>= (y b5) 7) (< (y b5) 9)))
(at-most-once (and (>= (x b1) 9) (< (x b1) 11)))
(at-most-once (and (>= (y b1) 9) (< (y b1) 11)))
(at-most-once (and (>= (x b2) 9) (< (x b2) 11)))
(at-most-once (and (>= (y b2) 9) (< (y b2) 11)))
(at-most-once (and (>= (x b3) 9) (< (x b3) 11)))
(at-most-once (and (>= (y b3) 9) (< (y b3) 11)))
(at-most-once (and (>= (x b4) 9) (< (x b4) 11)))
(at-most-once (and (>= (y b4) 9) (< (y b4) 11)))
(at-most-once (and (>= (x b5) 9) (< (x b5) 11)))
(at-most-once (and (>= (y b5) 9) (< (y b5) 11)))
(at-most-once (and (>= (x b1) 11) (< (x b1) 13)))
(at-most-once (and (>= (y b1) 11) (< (y b1) 13)))
(at-most-once (and (>= (x b2) 11) (< (x b2) 13)))
(at-most-once (and (>= (y b2) 11) (< (y b2) 13)))
(at-most-once (and (>= (x b3) 11) (< (x b3) 13)))
(at-most-once (and (>= (y b3) 11) (< (y b3) 13)))
(at-most-once (and (>= (x b4) 11) (< (x b4) 13)))
(at-most-once (and (>= (y b4) 11) (< (y b4) 13)))
(at-most-once (and (>= (x b5) 11) (< (x b5) 13)))
(at-most-once (and (>= (y b5) 11) (< (y b5) 13)))
(at-most-once (and (>= (x b1) 13) (< (x b1) 16)))
(at-most-once (and (>= (y b1) 13) (< (y b1) 16)))
(at-most-once (and (>= (x b2) 13) (< (x b2) 16)))
(at-most-once (and (>= (y b2) 13) (< (y b2) 16)))
(at-most-once (and (>= (x b3) 13) (< (x b3) 16)))
(at-most-once (and (>= (y b3) 13) (< (y b3) 16)))
(at-most-once (and (>= (x b4) 13) (< (x b4) 16)))
(at-most-once (and (>= (y b4) 13) (< (y b4) 16)))
(at-most-once (and (>= (x b5) 13) (< (x b5) 16)))
(at-most-once (and (>= (y b5) 13) (< (y b5) 16)))))

)