
(define (problem instance_7_20_5_2)
  (:domain mt-block-grouping)
  (:objects
    b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 b11 b12 b13 b14 b15 b16 b17 b18 b19 b20 - block
  )

  (:init
    (= (x b5) 5)
	(= (y b5) 2)
	(= (x b4) 5)
	(= (y b4) 4)
	(= (x b2) 1)
	(= (y b2) 6)
	(= (x b17) 1)
	(= (y b17) 2)
	(= (x b3) 4)
	(= (y b3) 3)
	(= (x b8) 3)
	(= (y b8) 5)
	(= (x b14) 1)
	(= (y b14) 4)
	(= (x b16) 1)
	(= (y b16) 4)
	(= (x b20) 4)
	(= (y b20) 6)
	(= (x b19) 5)
	(= (y b19) 3)
	(= (x b9) 4)
	(= (y b9) 1)
	(= (x b15) 2)
	(= (y b15) 6)
	(= (x b10) 4)
	(= (y b10) 1)
	(= (x b1) 7)
	(= (y b1) 1)
	(= (x b12) 7)
	(= (y b12) 2)
	(= (x b18) 3)
	(= (y b18) 5)
	(= (x b11) 1)
	(= (y b11) 2)
	(= (x b6) 2)
	(= (y b6) 1)
	(= (x b7) 5)
	(= (y b7) 4)
	(= (x b13) 3)
	(= (y b13) 2)
	(= (max_x) 7 )
	(= (min_x) 1 )
	(= (max_y) 7 )
	(= (min_y) 1 )
  )

  (:goal (and 
    (or (not (= (x b1) (x b2))) (not (= (y b1) (y b2))))
	(or (not (= (x b1) (x b3))) (not (= (y b1) (y b3))))
	(or (not (= (x b1) (x b4))) (not (= (y b1) (y b4))))
	(or (not (= (x b1) (x b5))) (not (= (y b1) (y b5))))
	(or (not (= (x b1) (x b6))) (not (= (y b1) (y b6))))
	(or (not (= (x b1) (x b7))) (not (= (y b1) (y b7))))
	(= (x b1) (x b8))
(= (y b1) (y b8))
	(= (x b1) (x b9))
(= (y b1) (y b9))
	(or (not (= (x b1) (x b10))) (not (= (y b1) (y b10))))
	(or (not (= (x b1) (x b11))) (not (= (y b1) (y b11))))
	(or (not (= (x b1) (x b12))) (not (= (y b1) (y b12))))
	(or (not (= (x b1) (x b13))) (not (= (y b1) (y b13))))
	(or (not (= (x b1) (x b14))) (not (= (y b1) (y b14))))
	(or (not (= (x b1) (x b15))) (not (= (y b1) (y b15))))
	(or (not (= (x b1) (x b16))) (not (= (y b1) (y b16))))
	(or (not (= (x b1) (x b17))) (not (= (y b1) (y b17))))
	(or (not (= (x b1) (x b18))) (not (= (y b1) (y b18))))
	(= (x b1) (x b19))
(= (y b1) (y b19))
	(or (not (= (x b1) (x b20))) (not (= (y b1) (y b20))))
	(= (x b2) (x b3))
(= (y b2) (y b3))
	(or (not (= (x b2) (x b4))) (not (= (y b2) (y b4))))
	(or (not (= (x b2) (x b5))) (not (= (y b2) (y b5))))
	(or (not (= (x b2) (x b6))) (not (= (y b2) (y b6))))
	(or (not (= (x b2) (x b7))) (not (= (y b2) (y b7))))
	(or (not (= (x b2) (x b8))) (not (= (y b2) (y b8))))
	(or (not (= (x b2) (x b9))) (not (= (y b2) (y b9))))
	(or (not (= (x b2) (x b20))) (not (= (y b2) (y b20))))
	(or (not (= (x b3) (x b4))) (not (= (y b3) (y b4))))
	(or (not (= (x b3) (x b5))) (not (= (y b3) (y b5))))
	(or (not (= (x b3) (x b6))) (not (= (y b3) (y b6))))
	(or (not (= (x b3) (x b7))) (not (= (y b3) (y b7))))
	(or (not (= (x b3) (x b8))) (not (= (y b3) (y b8))))
	(or (not (= (x b3) (x b9))) (not (= (y b3) (y b9))))
	(or (not (= (x b4) (x b5))) (not (= (y b4) (y b5))))
	(= (x b4) (x b6))
(= (y b4) (y b6))
	(= (x b4) (x b7))
(= (y b4) (y b7))
	(or (not (= (x b4) (x b8))) (not (= (y b4) (y b8))))
	(or (not (= (x b4) (x b9))) (not (= (y b4) (y b9))))
	(or (not (= (x b5) (x b6))) (not (= (y b5) (y b6))))
	(or (not (= (x b5) (x b7))) (not (= (y b5) (y b7))))
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
	(or (not (= (x b10) (x b2))) (not (= (y b10) (y b2))))
	(or (not (= (x b10) (x b3))) (not (= (y b10) (y b3))))
	(or (not (= (x b10) (x b4))) (not (= (y b10) (y b4))))
	(= (x b10) (x b5))
(= (y b10) (y b5))
	(or (not (= (x b10) (x b6))) (not (= (y b10) (y b6))))
	(or (not (= (x b10) (x b7))) (not (= (y b10) (y b7))))
	(or (not (= (x b10) (x b8))) (not (= (y b10) (y b8))))
	(or (not (= (x b10) (x b9))) (not (= (y b10) (y b9))))
	(= (x b10) (x b11))
(= (y b10) (y b11))
	(or (not (= (x b10) (x b12))) (not (= (y b10) (y b12))))
	(= (x b10) (x b13))
(= (y b10) (y b13))
	(= (x b10) (x b14))
(= (y b10) (y b14))
	(or (not (= (x b10) (x b15))) (not (= (y b10) (y b15))))
	(or (not (= (x b10) (x b16))) (not (= (y b10) (y b16))))
	(= (x b10) (x b17))
(= (y b10) (y b17))
	(or (not (= (x b10) (x b18))) (not (= (y b10) (y b18))))
	(or (not (= (x b10) (x b19))) (not (= (y b10) (y b19))))
	(or (not (= (x b10) (x b20))) (not (= (y b10) (y b20))))
	(or (not (= (x b11) (x b2))) (not (= (y b11) (y b2))))
	(or (not (= (x b11) (x b3))) (not (= (y b11) (y b3))))
	(or (not (= (x b11) (x b4))) (not (= (y b11) (y b4))))
	(= (x b11) (x b5))
(= (y b11) (y b5))
	(or (not (= (x b11) (x b6))) (not (= (y b11) (y b6))))
	(or (not (= (x b11) (x b7))) (not (= (y b11) (y b7))))
	(or (not (= (x b11) (x b8))) (not (= (y b11) (y b8))))
	(or (not (= (x b11) (x b9))) (not (= (y b11) (y b9))))
	(or (not (= (x b11) (x b12))) (not (= (y b11) (y b12))))
	(= (x b11) (x b13))
(= (y b11) (y b13))
	(= (x b11) (x b14))
(= (y b11) (y b14))
	(or (not (= (x b11) (x b15))) (not (= (y b11) (y b15))))
	(or (not (= (x b11) (x b16))) (not (= (y b11) (y b16))))
	(= (x b11) (x b17))
(= (y b11) (y b17))
	(or (not (= (x b11) (x b18))) (not (= (y b11) (y b18))))
	(or (not (= (x b11) (x b19))) (not (= (y b11) (y b19))))
	(or (not (= (x b11) (x b20))) (not (= (y b11) (y b20))))
	(= (x b12) (x b2))
(= (y b12) (y b2))
	(= (x b12) (x b3))
(= (y b12) (y b3))
	(or (not (= (x b12) (x b4))) (not (= (y b12) (y b4))))
	(or (not (= (x b12) (x b5))) (not (= (y b12) (y b5))))
	(or (not (= (x b12) (x b6))) (not (= (y b12) (y b6))))
	(or (not (= (x b12) (x b7))) (not (= (y b12) (y b7))))
	(or (not (= (x b12) (x b8))) (not (= (y b12) (y b8))))
	(or (not (= (x b12) (x b9))) (not (= (y b12) (y b9))))
	(or (not (= (x b12) (x b13))) (not (= (y b12) (y b13))))
	(or (not (= (x b12) (x b14))) (not (= (y b12) (y b14))))
	(or (not (= (x b12) (x b15))) (not (= (y b12) (y b15))))
	(or (not (= (x b12) (x b16))) (not (= (y b12) (y b16))))
	(or (not (= (x b12) (x b17))) (not (= (y b12) (y b17))))
	(= (x b12) (x b18))
(= (y b12) (y b18))
	(or (not (= (x b12) (x b19))) (not (= (y b12) (y b19))))
	(or (not (= (x b12) (x b20))) (not (= (y b12) (y b20))))
	(or (not (= (x b13) (x b2))) (not (= (y b13) (y b2))))
	(or (not (= (x b13) (x b3))) (not (= (y b13) (y b3))))
	(or (not (= (x b13) (x b4))) (not (= (y b13) (y b4))))
	(= (x b13) (x b5))
(= (y b13) (y b5))
	(or (not (= (x b13) (x b6))) (not (= (y b13) (y b6))))
	(or (not (= (x b13) (x b7))) (not (= (y b13) (y b7))))
	(or (not (= (x b13) (x b8))) (not (= (y b13) (y b8))))
	(or (not (= (x b13) (x b9))) (not (= (y b13) (y b9))))
	(= (x b13) (x b14))
(= (y b13) (y b14))
	(or (not (= (x b13) (x b15))) (not (= (y b13) (y b15))))
	(or (not (= (x b13) (x b16))) (not (= (y b13) (y b16))))
	(= (x b13) (x b17))
(= (y b13) (y b17))
	(or (not (= (x b13) (x b18))) (not (= (y b13) (y b18))))
	(or (not (= (x b13) (x b19))) (not (= (y b13) (y b19))))
	(or (not (= (x b13) (x b20))) (not (= (y b13) (y b20))))
	(or (not (= (x b14) (x b2))) (not (= (y b14) (y b2))))
	(or (not (= (x b14) (x b3))) (not (= (y b14) (y b3))))
	(or (not (= (x b14) (x b4))) (not (= (y b14) (y b4))))
	(= (x b14) (x b5))
(= (y b14) (y b5))
	(or (not (= (x b14) (x b6))) (not (= (y b14) (y b6))))
	(or (not (= (x b14) (x b7))) (not (= (y b14) (y b7))))
	(or (not (= (x b14) (x b8))) (not (= (y b14) (y b8))))
	(or (not (= (x b14) (x b9))) (not (= (y b14) (y b9))))
	(or (not (= (x b14) (x b15))) (not (= (y b14) (y b15))))
	(or (not (= (x b14) (x b16))) (not (= (y b14) (y b16))))
	(= (x b14) (x b17))
(= (y b14) (y b17))
	(or (not (= (x b14) (x b18))) (not (= (y b14) (y b18))))
	(or (not (= (x b14) (x b19))) (not (= (y b14) (y b19))))
	(or (not (= (x b14) (x b20))) (not (= (y b14) (y b20))))
	(or (not (= (x b15) (x b2))) (not (= (y b15) (y b2))))
	(or (not (= (x b15) (x b3))) (not (= (y b15) (y b3))))
	(= (x b15) (x b4))
(= (y b15) (y b4))
	(or (not (= (x b15) (x b5))) (not (= (y b15) (y b5))))
	(= (x b15) (x b6))
(= (y b15) (y b6))
	(= (x b15) (x b7))
(= (y b15) (y b7))
	(or (not (= (x b15) (x b8))) (not (= (y b15) (y b8))))
	(or (not (= (x b15) (x b9))) (not (= (y b15) (y b9))))
	(or (not (= (x b15) (x b16))) (not (= (y b15) (y b16))))
	(or (not (= (x b15) (x b17))) (not (= (y b15) (y b17))))
	(or (not (= (x b15) (x b18))) (not (= (y b15) (y b18))))
	(or (not (= (x b15) (x b19))) (not (= (y b15) (y b19))))
	(= (x b15) (x b20))
(= (y b15) (y b20))
	(or (not (= (x b16) (x b2))) (not (= (y b16) (y b2))))
	(or (not (= (x b16) (x b3))) (not (= (y b16) (y b3))))
	(or (not (= (x b16) (x b4))) (not (= (y b16) (y b4))))
	(or (not (= (x b16) (x b5))) (not (= (y b16) (y b5))))
	(or (not (= (x b16) (x b6))) (not (= (y b16) (y b6))))
	(or (not (= (x b16) (x b7))) (not (= (y b16) (y b7))))
	(or (not (= (x b16) (x b8))) (not (= (y b16) (y b8))))
	(or (not (= (x b16) (x b9))) (not (= (y b16) (y b9))))
	(or (not (= (x b16) (x b17))) (not (= (y b16) (y b17))))
	(or (not (= (x b16) (x b18))) (not (= (y b16) (y b18))))
	(or (not (= (x b16) (x b19))) (not (= (y b16) (y b19))))
	(or (not (= (x b16) (x b20))) (not (= (y b16) (y b20))))
	(or (not (= (x b17) (x b2))) (not (= (y b17) (y b2))))
	(or (not (= (x b17) (x b3))) (not (= (y b17) (y b3))))
	(or (not (= (x b17) (x b4))) (not (= (y b17) (y b4))))
	(= (x b17) (x b5))
(= (y b17) (y b5))
	(or (not (= (x b17) (x b6))) (not (= (y b17) (y b6))))
	(or (not (= (x b17) (x b7))) (not (= (y b17) (y b7))))
	(or (not (= (x b17) (x b8))) (not (= (y b17) (y b8))))
	(or (not (= (x b17) (x b9))) (not (= (y b17) (y b9))))
	(or (not (= (x b17) (x b18))) (not (= (y b17) (y b18))))
	(or (not (= (x b17) (x b19))) (not (= (y b17) (y b19))))
	(or (not (= (x b17) (x b20))) (not (= (y b17) (y b20))))
	(= (x b18) (x b2))
(= (y b18) (y b2))
	(= (x b18) (x b3))
(= (y b18) (y b3))
	(or (not (= (x b18) (x b4))) (not (= (y b18) (y b4))))
	(or (not (= (x b18) (x b5))) (not (= (y b18) (y b5))))
	(or (not (= (x b18) (x b6))) (not (= (y b18) (y b6))))
	(or (not (= (x b18) (x b7))) (not (= (y b18) (y b7))))
	(or (not (= (x b18) (x b8))) (not (= (y b18) (y b8))))
	(or (not (= (x b18) (x b9))) (not (= (y b18) (y b9))))
	(or (not (= (x b18) (x b19))) (not (= (y b18) (y b19))))
	(or (not (= (x b18) (x b20))) (not (= (y b18) (y b20))))
	(or (not (= (x b19) (x b2))) (not (= (y b19) (y b2))))
	(or (not (= (x b19) (x b3))) (not (= (y b19) (y b3))))
	(or (not (= (x b19) (x b4))) (not (= (y b19) (y b4))))
	(or (not (= (x b19) (x b5))) (not (= (y b19) (y b5))))
	(or (not (= (x b19) (x b6))) (not (= (y b19) (y b6))))
	(or (not (= (x b19) (x b7))) (not (= (y b19) (y b7))))
	(= (x b19) (x b8))
(= (y b19) (y b8))
	(= (x b19) (x b9))
(= (y b19) (y b9))
	(or (not (= (x b19) (x b20))) (not (= (y b19) (y b20))))
	(or (not (= (x b20) (x b3))) (not (= (y b20) (y b3))))
	(= (x b20) (x b4))
(= (y b20) (y b4))
	(or (not (= (x b20) (x b5))) (not (= (y b20) (y b5))))
	(= (x b20) (x b6))
(= (y b20) (y b6))
	(= (x b20) (x b7))
(= (y b20) (y b7))
	(or (not (= (x b20) (x b8))) (not (= (y b20) (y b8))))
	(or (not (= (x b20) (x b9))) (not (= (y b20) (y b9))))
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
(at-most-once (and (>= (x b11) 1) (< (x b11) 3)))
(at-most-once (and (>= (y b11) 1) (< (y b11) 3)))
(at-most-once (and (>= (x b12) 1) (< (x b12) 3)))
(at-most-once (and (>= (y b12) 1) (< (y b12) 3)))
(at-most-once (and (>= (x b13) 1) (< (x b13) 3)))
(at-most-once (and (>= (y b13) 1) (< (y b13) 3)))
(at-most-once (and (>= (x b14) 1) (< (x b14) 3)))
(at-most-once (and (>= (y b14) 1) (< (y b14) 3)))
(at-most-once (and (>= (x b15) 1) (< (x b15) 3)))
(at-most-once (and (>= (y b15) 1) (< (y b15) 3)))
(at-most-once (and (>= (x b16) 1) (< (x b16) 3)))
(at-most-once (and (>= (y b16) 1) (< (y b16) 3)))
(at-most-once (and (>= (x b17) 1) (< (x b17) 3)))
(at-most-once (and (>= (y b17) 1) (< (y b17) 3)))
(at-most-once (and (>= (x b18) 1) (< (x b18) 3)))
(at-most-once (and (>= (y b18) 1) (< (y b18) 3)))
(at-most-once (and (>= (x b19) 1) (< (x b19) 3)))
(at-most-once (and (>= (y b19) 1) (< (y b19) 3)))
(at-most-once (and (>= (x b20) 1) (< (x b20) 3)))
(at-most-once (and (>= (y b20) 1) (< (y b20) 3)))
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
(at-most-once (and (>= (x b11) 3) (< (x b11) 5)))
(at-most-once (and (>= (y b11) 3) (< (y b11) 5)))
(at-most-once (and (>= (x b12) 3) (< (x b12) 5)))
(at-most-once (and (>= (y b12) 3) (< (y b12) 5)))
(at-most-once (and (>= (x b13) 3) (< (x b13) 5)))
(at-most-once (and (>= (y b13) 3) (< (y b13) 5)))
(at-most-once (and (>= (x b14) 3) (< (x b14) 5)))
(at-most-once (and (>= (y b14) 3) (< (y b14) 5)))
(at-most-once (and (>= (x b15) 3) (< (x b15) 5)))
(at-most-once (and (>= (y b15) 3) (< (y b15) 5)))
(at-most-once (and (>= (x b16) 3) (< (x b16) 5)))
(at-most-once (and (>= (y b16) 3) (< (y b16) 5)))
(at-most-once (and (>= (x b17) 3) (< (x b17) 5)))
(at-most-once (and (>= (y b17) 3) (< (y b17) 5)))
(at-most-once (and (>= (x b18) 3) (< (x b18) 5)))
(at-most-once (and (>= (y b18) 3) (< (y b18) 5)))
(at-most-once (and (>= (x b19) 3) (< (x b19) 5)))
(at-most-once (and (>= (y b19) 3) (< (y b19) 5)))
(at-most-once (and (>= (x b20) 3) (< (x b20) 5)))
(at-most-once (and (>= (y b20) 3) (< (y b20) 5)))
(at-most-once (and (>= (x b1) 5) (< (x b1) 8)))
(at-most-once (and (>= (y b1) 5) (< (y b1) 8)))
(at-most-once (and (>= (x b2) 5) (< (x b2) 8)))
(at-most-once (and (>= (y b2) 5) (< (y b2) 8)))
(at-most-once (and (>= (x b3) 5) (< (x b3) 8)))
(at-most-once (and (>= (y b3) 5) (< (y b3) 8)))
(at-most-once (and (>= (x b4) 5) (< (x b4) 8)))
(at-most-once (and (>= (y b4) 5) (< (y b4) 8)))
(at-most-once (and (>= (x b5) 5) (< (x b5) 8)))
(at-most-once (and (>= (y b5) 5) (< (y b5) 8)))
(at-most-once (and (>= (x b6) 5) (< (x b6) 8)))
(at-most-once (and (>= (y b6) 5) (< (y b6) 8)))
(at-most-once (and (>= (x b7) 5) (< (x b7) 8)))
(at-most-once (and (>= (y b7) 5) (< (y b7) 8)))
(at-most-once (and (>= (x b8) 5) (< (x b8) 8)))
(at-most-once (and (>= (y b8) 5) (< (y b8) 8)))
(at-most-once (and (>= (x b9) 5) (< (x b9) 8)))
(at-most-once (and (>= (y b9) 5) (< (y b9) 8)))
(at-most-once (and (>= (x b10) 5) (< (x b10) 8)))
(at-most-once (and (>= (y b10) 5) (< (y b10) 8)))
(at-most-once (and (>= (x b11) 5) (< (x b11) 8)))
(at-most-once (and (>= (y b11) 5) (< (y b11) 8)))
(at-most-once (and (>= (x b12) 5) (< (x b12) 8)))
(at-most-once (and (>= (y b12) 5) (< (y b12) 8)))
(at-most-once (and (>= (x b13) 5) (< (x b13) 8)))
(at-most-once (and (>= (y b13) 5) (< (y b13) 8)))
(at-most-once (and (>= (x b14) 5) (< (x b14) 8)))
(at-most-once (and (>= (y b14) 5) (< (y b14) 8)))
(at-most-once (and (>= (x b15) 5) (< (x b15) 8)))
(at-most-once (and (>= (y b15) 5) (< (y b15) 8)))
(at-most-once (and (>= (x b16) 5) (< (x b16) 8)))
(at-most-once (and (>= (y b16) 5) (< (y b16) 8)))
(at-most-once (and (>= (x b17) 5) (< (x b17) 8)))
(at-most-once (and (>= (y b17) 5) (< (y b17) 8)))
(at-most-once (and (>= (x b18) 5) (< (x b18) 8)))
(at-most-once (and (>= (y b18) 5) (< (y b18) 8)))
(at-most-once (and (>= (x b19) 5) (< (x b19) 8)))
(at-most-once (and (>= (y b19) 5) (< (y b19) 8)))
(at-most-once (and (>= (x b20) 5) (< (x b20) 8)))
(at-most-once (and (>= (y b20) 5) (< (y b20) 8)))))

)