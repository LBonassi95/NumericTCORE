
(define (problem instance_5_5_2_2)
  (:domain mt-block-grouping)
  (:objects
    b1 b2 b3 b4 b5 - block
  )

  (:init
    (= (x b3) 2)
	(= (y b3) 1)
	(= (x b4) 2)
	(= (y b4) 2)
	(= (x b2) 5)
	(= (y b2) 1)
	(= (x b1) 4)
	(= (y b1) 5)
	(= (x b5) 3)
	(= (y b5) 2)
	(= (max_x) 5 )
	(= (min_x) 1 )
	(= (max_y) 5 )
	(= (min_y) 1 )
  )

  (:goal (and 
    (or (not (= (x b1) (x b2))) (not (= (y b1) (y b2))))
	(or (not (= (x b1) (x b3))) (not (= (y b1) (y b3))))
	(= (x b1) (x b4))
(= (y b1) (y b4))
	(= (x b1) (x b5))
(= (y b1) (y b5))
	(= (x b2) (x b3))
(= (y b2) (y b3))
	(or (not (= (x b2) (x b4))) (not (= (y b2) (y b4))))
	(or (not (= (x b2) (x b5))) (not (= (y b2) (y b5))))
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
(at-most-once (and (>= (x b1) 3) (< (x b1) 6)))
(at-most-once (and (>= (y b1) 3) (< (y b1) 6)))
(at-most-once (and (>= (x b2) 3) (< (x b2) 6)))
(at-most-once (and (>= (y b2) 3) (< (y b2) 6)))
(at-most-once (and (>= (x b3) 3) (< (x b3) 6)))
(at-most-once (and (>= (y b3) 3) (< (y b3) 6)))
(at-most-once (and (>= (x b4) 3) (< (x b4) 6)))
(at-most-once (and (>= (y b4) 3) (< (y b4) 6)))
(at-most-once (and (>= (x b5) 3) (< (x b5) 6)))
(at-most-once (and (>= (y b5) 3) (< (y b5) 6)))))

)