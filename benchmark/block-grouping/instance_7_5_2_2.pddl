
(define (problem instance_7_5_2_2)
  (:domain mt-block-grouping)
  (:objects
    b1 b2 b3 b4 b5 - block
  )

  (:init
    (= (x b3) 4)
	(= (y b3) 7)
	(= (x b4) 6)
	(= (y b4) 4)
	(= (x b2) 1)
	(= (y b2) 6)
	(= (x b1) 5)
	(= (y b1) 4)
	(= (x b5) 5)
	(= (y b5) 6)
	(= (max_x) 7 )
	(= (min_x) 1 )
	(= (max_y) 7 )
	(= (min_y) 1 )
  )

  (:goal (and 
    (or (not (= (x b1) (x b2))) (not (= (y b1) (y b2))))
	(= (x b1) (x b3))
(= (y b1) (y b3))
	(= (x b1) (x b4))
(= (y b1) (y b4))
	(or (not (= (x b1) (x b5))) (not (= (y b1) (y b5))))
	(or (not (= (x b2) (x b3))) (not (= (y b2) (y b3))))
	(or (not (= (x b2) (x b4))) (not (= (y b2) (y b4))))
	(= (x b2) (x b5))
(= (y b2) (y b5))
	(= (x b3) (x b4))
(= (y b3) (y b4))
	(or (not (= (x b3) (x b5))) (not (= (y b3) (y b5))))
	(or (not (= (x b4) (x b5))) (not (= (y b4) (y b5))))
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
(at-most-once (and (>= (x b1) 5) (< (x b1) 8)))
(at-most-once (and (>= (y b1) 5) (< (y b1) 8)))
(at-most-once (and (>= (x b2) 5) (< (x b2) 8)))
(at-most-once (and (>= (y b2) 5) (< (y b2) 8)))
(at-most-once (and (>= (x b3) 5) (< (x b3) 8)))
(at-most-once (and (>= (y b3) 5) (< (y b3) 8)))
(at-most-once (and (>= (x b4) 5) (< (x b4) 8)))
(at-most-once (and (>= (y b4) 5) (< (y b4) 8)))
(at-most-once (and (>= (x b5) 5) (< (x b5) 8)))
(at-most-once (and (>= (y b5) 5) (< (y b5) 8)))))

)