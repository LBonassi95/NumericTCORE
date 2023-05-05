
(define (problem instance_15_20_5_2)
  (:domain mt-block-grouping)
  (:objects
    b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 b11 b12 b13 b14 b15 b16 b17 b18 b19 b20 - block
  )

  (:init
    (= (x b5) 6)
	(= (y b5) 3)
	(= (x b4) 10)
	(= (y b4) 1)
	(= (x b2) 2)
	(= (y b2) 15)
	(= (x b17) 15)
	(= (y b17) 1)
	(= (x b3) 6)
	(= (y b3) 1)
	(= (x b8) 7)
	(= (y b8) 14)
	(= (x b14) 1)
	(= (y b14) 10)
	(= (x b16) 13)
	(= (y b16) 9)
	(= (x b20) 14)
	(= (y b20) 6)
	(= (x b19) 4)
	(= (y b19) 7)
	(= (x b9) 6)
	(= (y b9) 1)
	(= (x b15) 15)
	(= (y b15) 1)
	(= (x b10) 13)
	(= (y b10) 15)
	(= (x b1) 14)
	(= (y b1) 13)
	(= (x b12) 11)
	(= (y b12) 2)
	(= (x b18) 2)
	(= (y b18) 11)
	(= (x b11) 3)
	(= (y b11) 8)
	(= (x b6) 6)
	(= (y b6) 13)
	(= (x b7) 8)
	(= (y b7) 13)
	(= (x b13) 12)
	(= (y b13) 4)
	(= (max_x) 15 )
	(= (min_x) 1 )
	(= (max_y) 15 )
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
	(or (not (= (x b1) (x b8))) (not (= (y b1) (y b8))))
	(or (not (= (x b1) (x b9))) (not (= (y b1) (y b9))))
	(or (not (= (x b1) (x b10))) (not (= (y b1) (y b10))))
	(= (x b1) (x b11))
(= (y b1) (y b11))
	(or (not (= (x b1) (x b12))) (not (= (y b1) (y b12))))
	(or (not (= (x b1) (x b13))) (not (= (y b1) (y b13))))
	(or (not (= (x b1) (x b14))) (not (= (y b1) (y b14))))
	(= (x b1) (x b15))
(= (y b1) (y b15))
	(or (not (= (x b1) (x b16))) (not (= (y b1) (y b16))))
	(or (not (= (x b1) (x b17))) (not (= (y b1) (y b17))))
	(or (not (= (x b1) (x b18))) (not (= (y b1) (y b18))))
	(= (x b1) (x b19))
(= (y b1) (y b19))
	(or (not (= (x b1) (x b20))) (not (= (y b1) (y b20))))
	(or (not (= (x b2) (x b3))) (not (= (y b2) (y b3))))
	(or (not (= (x b2) (x b4))) (not (= (y b2) (y b4))))
	(or (not (= (x b2) (x b5))) (not (= (y b2) (y b5))))
	(or (not (= (x b2) (x b6))) (not (= (y b2) (y b6))))
	(or (not (= (x b2) (x b7))) (not (= (y b2) (y b7))))
	(or (not (= (x b2) (x b8))) (not (= (y b2) (y b8))))
	(or (not (= (x b2) (x b9))) (not (= (y b2) (y b9))))
	(or (not (= (x b2) (x b20))) (not (= (y b2) (y b20))))
	(= (x b3) (x b4))
(= (y b3) (y b4))
	(or (not (= (x b3) (x b5))) (not (= (y b3) (y b5))))
	(or (not (= (x b3) (x b6))) (not (= (y b3) (y b6))))
	(= (x b3) (x b7))
(= (y b3) (y b7))
	(= (x b3) (x b8))
(= (y b3) (y b8))
	(or (not (= (x b3) (x b9))) (not (= (y b3) (y b9))))
	(or (not (= (x b4) (x b5))) (not (= (y b4) (y b5))))
	(or (not (= (x b4) (x b6))) (not (= (y b4) (y b6))))
	(= (x b4) (x b7))
(= (y b4) (y b7))
	(= (x b4) (x b8))
(= (y b4) (y b8))
	(or (not (= (x b4) (x b9))) (not (= (y b4) (y b9))))
	(or (not (= (x b5) (x b6))) (not (= (y b5) (y b6))))
	(or (not (= (x b5) (x b7))) (not (= (y b5) (y b7))))
	(or (not (= (x b5) (x b8))) (not (= (y b5) (y b8))))
	(or (not (= (x b5) (x b9))) (not (= (y b5) (y b9))))
	(or (not (= (x b6) (x b7))) (not (= (y b6) (y b7))))
	(or (not (= (x b6) (x b8))) (not (= (y b6) (y b8))))
	(= (x b6) (x b9))
(= (y b6) (y b9))
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
	(or (not (= (x b10) (x b9))) (not (= (y b10) (y b9))))
	(or (not (= (x b10) (x b11))) (not (= (y b10) (y b11))))
	(= (x b10) (x b12))
(= (y b10) (y b12))
	(or (not (= (x b10) (x b13))) (not (= (y b10) (y b13))))
	(or (not (= (x b10) (x b14))) (not (= (y b10) (y b14))))
	(or (not (= (x b10) (x b15))) (not (= (y b10) (y b15))))
	(or (not (= (x b10) (x b16))) (not (= (y b10) (y b16))))
	(or (not (= (x b10) (x b17))) (not (= (y b10) (y b17))))
	(= (x b10) (x b18))
(= (y b10) (y b18))
	(or (not (= (x b10) (x b19))) (not (= (y b10) (y b19))))
	(or (not (= (x b10) (x b20))) (not (= (y b10) (y b20))))
	(= (x b11) (x b2))
(= (y b11) (y b2))
	(or (not (= (x b11) (x b3))) (not (= (y b11) (y b3))))
	(or (not (= (x b11) (x b4))) (not (= (y b11) (y b4))))
	(or (not (= (x b11) (x b5))) (not (= (y b11) (y b5))))
	(or (not (= (x b11) (x b6))) (not (= (y b11) (y b6))))
	(or (not (= (x b11) (x b7))) (not (= (y b11) (y b7))))
	(or (not (= (x b11) (x b8))) (not (= (y b11) (y b8))))
	(or (not (= (x b11) (x b9))) (not (= (y b11) (y b9))))
	(or (not (= (x b11) (x b12))) (not (= (y b11) (y b12))))
	(or (not (= (x b11) (x b13))) (not (= (y b11) (y b13))))
	(or (not (= (x b11) (x b14))) (not (= (y b11) (y b14))))
	(= (x b11) (x b15))
(= (y b11) (y b15))
	(or (not (= (x b11) (x b16))) (not (= (y b11) (y b16))))
	(or (not (= (x b11) (x b17))) (not (= (y b11) (y b17))))
	(or (not (= (x b11) (x b18))) (not (= (y b11) (y b18))))
	(= (x b11) (x b19))
(= (y b11) (y b19))
	(or (not (= (x b11) (x b20))) (not (= (y b11) (y b20))))
	(or (not (= (x b12) (x b2))) (not (= (y b12) (y b2))))
	(or (not (= (x b12) (x b3))) (not (= (y b12) (y b3))))
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
	(= (x b13) (x b3))
(= (y b13) (y b3))
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
	(= (x b13) (x b16))
(= (y b13) (y b16))
	(or (not (= (x b13) (x b17))) (not (= (y b13) (y b17))))
	(or (not (= (x b13) (x b18))) (not (= (y b13) (y b18))))
	(or (not (= (x b13) (x b19))) (not (= (y b13) (y b19))))
	(= (x b13) (x b20))
(= (y b13) (y b20))
	(or (not (= (x b14) (x b2))) (not (= (y b14) (y b2))))
	(= (x b14) (x b3))
(= (y b14) (y b3))
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
	(= (x b14) (x b16))
(= (y b14) (y b16))
	(or (not (= (x b14) (x b17))) (not (= (y b14) (y b17))))
	(or (not (= (x b14) (x b18))) (not (= (y b14) (y b18))))
	(or (not (= (x b14) (x b19))) (not (= (y b14) (y b19))))
	(= (x b14) (x b20))
(= (y b14) (y b20))
	(= (x b15) (x b2))
(= (y b15) (y b2))
	(or (not (= (x b15) (x b3))) (not (= (y b15) (y b3))))
	(or (not (= (x b15) (x b4))) (not (= (y b15) (y b4))))
	(or (not (= (x b15) (x b5))) (not (= (y b15) (y b5))))
	(or (not (= (x b15) (x b6))) (not (= (y b15) (y b6))))
	(or (not (= (x b15) (x b7))) (not (= (y b15) (y b7))))
	(or (not (= (x b15) (x b8))) (not (= (y b15) (y b8))))
	(or (not (= (x b15) (x b9))) (not (= (y b15) (y b9))))
	(or (not (= (x b15) (x b16))) (not (= (y b15) (y b16))))
	(or (not (= (x b15) (x b17))) (not (= (y b15) (y b17))))
	(or (not (= (x b15) (x b18))) (not (= (y b15) (y b18))))
	(= (x b15) (x b19))
(= (y b15) (y b19))
	(or (not (= (x b15) (x b20))) (not (= (y b15) (y b20))))
	(or (not (= (x b16) (x b2))) (not (= (y b16) (y b2))))
	(= (x b16) (x b3))
(= (y b16) (y b3))
	(= (x b16) (x b4))
(= (y b16) (y b4))
	(or (not (= (x b16) (x b5))) (not (= (y b16) (y b5))))
	(or (not (= (x b16) (x b6))) (not (= (y b16) (y b6))))
	(= (x b16) (x b7))
(= (y b16) (y b7))
	(= (x b16) (x b8))
(= (y b16) (y b8))
	(or (not (= (x b16) (x b9))) (not (= (y b16) (y b9))))
	(or (not (= (x b16) (x b17))) (not (= (y b16) (y b17))))
	(or (not (= (x b16) (x b18))) (not (= (y b16) (y b18))))
	(or (not (= (x b16) (x b19))) (not (= (y b16) (y b19))))
	(= (x b16) (x b20))
(= (y b16) (y b20))
	(or (not (= (x b17) (x b2))) (not (= (y b17) (y b2))))
	(or (not (= (x b17) (x b3))) (not (= (y b17) (y b3))))
	(or (not (= (x b17) (x b4))) (not (= (y b17) (y b4))))
	(or (not (= (x b17) (x b5))) (not (= (y b17) (y b5))))
	(= (x b17) (x b6))
(= (y b17) (y b6))
	(or (not (= (x b17) (x b7))) (not (= (y b17) (y b7))))
	(or (not (= (x b17) (x b8))) (not (= (y b17) (y b8))))
	(= (x b17) (x b9))
(= (y b17) (y b9))
	(or (not (= (x b17) (x b18))) (not (= (y b17) (y b18))))
	(or (not (= (x b17) (x b19))) (not (= (y b17) (y b19))))
	(or (not (= (x b17) (x b20))) (not (= (y b17) (y b20))))
	(or (not (= (x b18) (x b2))) (not (= (y b18) (y b2))))
	(or (not (= (x b18) (x b3))) (not (= (y b18) (y b3))))
	(or (not (= (x b18) (x b4))) (not (= (y b18) (y b4))))
	(or (not (= (x b18) (x b5))) (not (= (y b18) (y b5))))
	(or (not (= (x b18) (x b6))) (not (= (y b18) (y b6))))
	(or (not (= (x b18) (x b7))) (not (= (y b18) (y b7))))
	(or (not (= (x b18) (x b8))) (not (= (y b18) (y b8))))
	(or (not (= (x b18) (x b9))) (not (= (y b18) (y b9))))
	(or (not (= (x b18) (x b19))) (not (= (y b18) (y b19))))
	(or (not (= (x b18) (x b20))) (not (= (y b18) (y b20))))
	(= (x b19) (x b2))
(= (y b19) (y b2))
	(or (not (= (x b19) (x b3))) (not (= (y b19) (y b3))))
	(or (not (= (x b19) (x b4))) (not (= (y b19) (y b4))))
	(or (not (= (x b19) (x b5))) (not (= (y b19) (y b5))))
	(or (not (= (x b19) (x b6))) (not (= (y b19) (y b6))))
	(or (not (= (x b19) (x b7))) (not (= (y b19) (y b7))))
	(or (not (= (x b19) (x b8))) (not (= (y b19) (y b8))))
	(or (not (= (x b19) (x b9))) (not (= (y b19) (y b9))))
	(or (not (= (x b19) (x b20))) (not (= (y b19) (y b20))))
	(= (x b20) (x b3))
(= (y b20) (y b3))
	(= (x b20) (x b4))
(= (y b20) (y b4))
	(or (not (= (x b20) (x b5))) (not (= (y b20) (y b5))))
	(or (not (= (x b20) (x b6))) (not (= (y b20) (y b6))))
	(= (x b20) (x b7))
(= (y b20) (y b7))
	(= (x b20) (x b8))
(= (y b20) (y b8))
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
(at-most-once (and (>= (x b11) 5) (< (x b11) 7)))
(at-most-once (and (>= (y b11) 5) (< (y b11) 7)))
(at-most-once (and (>= (x b12) 5) (< (x b12) 7)))
(at-most-once (and (>= (y b12) 5) (< (y b12) 7)))
(at-most-once (and (>= (x b13) 5) (< (x b13) 7)))
(at-most-once (and (>= (y b13) 5) (< (y b13) 7)))
(at-most-once (and (>= (x b14) 5) (< (x b14) 7)))
(at-most-once (and (>= (y b14) 5) (< (y b14) 7)))
(at-most-once (and (>= (x b15) 5) (< (x b15) 7)))
(at-most-once (and (>= (y b15) 5) (< (y b15) 7)))
(at-most-once (and (>= (x b16) 5) (< (x b16) 7)))
(at-most-once (and (>= (y b16) 5) (< (y b16) 7)))
(at-most-once (and (>= (x b17) 5) (< (x b17) 7)))
(at-most-once (and (>= (y b17) 5) (< (y b17) 7)))
(at-most-once (and (>= (x b18) 5) (< (x b18) 7)))
(at-most-once (and (>= (y b18) 5) (< (y b18) 7)))
(at-most-once (and (>= (x b19) 5) (< (x b19) 7)))
(at-most-once (and (>= (y b19) 5) (< (y b19) 7)))
(at-most-once (and (>= (x b20) 5) (< (x b20) 7)))
(at-most-once (and (>= (y b20) 5) (< (y b20) 7)))
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
(at-most-once (and (>= (x b6) 7) (< (x b6) 9)))
(at-most-once (and (>= (y b6) 7) (< (y b6) 9)))
(at-most-once (and (>= (x b7) 7) (< (x b7) 9)))
(at-most-once (and (>= (y b7) 7) (< (y b7) 9)))
(at-most-once (and (>= (x b8) 7) (< (x b8) 9)))
(at-most-once (and (>= (y b8) 7) (< (y b8) 9)))
(at-most-once (and (>= (x b9) 7) (< (x b9) 9)))
(at-most-once (and (>= (y b9) 7) (< (y b9) 9)))
(at-most-once (and (>= (x b10) 7) (< (x b10) 9)))
(at-most-once (and (>= (y b10) 7) (< (y b10) 9)))
(at-most-once (and (>= (x b11) 7) (< (x b11) 9)))
(at-most-once (and (>= (y b11) 7) (< (y b11) 9)))
(at-most-once (and (>= (x b12) 7) (< (x b12) 9)))
(at-most-once (and (>= (y b12) 7) (< (y b12) 9)))
(at-most-once (and (>= (x b13) 7) (< (x b13) 9)))
(at-most-once (and (>= (y b13) 7) (< (y b13) 9)))
(at-most-once (and (>= (x b14) 7) (< (x b14) 9)))
(at-most-once (and (>= (y b14) 7) (< (y b14) 9)))
(at-most-once (and (>= (x b15) 7) (< (x b15) 9)))
(at-most-once (and (>= (y b15) 7) (< (y b15) 9)))
(at-most-once (and (>= (x b16) 7) (< (x b16) 9)))
(at-most-once (and (>= (y b16) 7) (< (y b16) 9)))
(at-most-once (and (>= (x b17) 7) (< (x b17) 9)))
(at-most-once (and (>= (y b17) 7) (< (y b17) 9)))
(at-most-once (and (>= (x b18) 7) (< (x b18) 9)))
(at-most-once (and (>= (y b18) 7) (< (y b18) 9)))
(at-most-once (and (>= (x b19) 7) (< (x b19) 9)))
(at-most-once (and (>= (y b19) 7) (< (y b19) 9)))
(at-most-once (and (>= (x b20) 7) (< (x b20) 9)))
(at-most-once (and (>= (y b20) 7) (< (y b20) 9)))
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
(at-most-once (and (>= (x b6) 9) (< (x b6) 11)))
(at-most-once (and (>= (y b6) 9) (< (y b6) 11)))
(at-most-once (and (>= (x b7) 9) (< (x b7) 11)))
(at-most-once (and (>= (y b7) 9) (< (y b7) 11)))
(at-most-once (and (>= (x b8) 9) (< (x b8) 11)))
(at-most-once (and (>= (y b8) 9) (< (y b8) 11)))
(at-most-once (and (>= (x b9) 9) (< (x b9) 11)))
(at-most-once (and (>= (y b9) 9) (< (y b9) 11)))
(at-most-once (and (>= (x b10) 9) (< (x b10) 11)))
(at-most-once (and (>= (y b10) 9) (< (y b10) 11)))
(at-most-once (and (>= (x b11) 9) (< (x b11) 11)))
(at-most-once (and (>= (y b11) 9) (< (y b11) 11)))
(at-most-once (and (>= (x b12) 9) (< (x b12) 11)))
(at-most-once (and (>= (y b12) 9) (< (y b12) 11)))
(at-most-once (and (>= (x b13) 9) (< (x b13) 11)))
(at-most-once (and (>= (y b13) 9) (< (y b13) 11)))
(at-most-once (and (>= (x b14) 9) (< (x b14) 11)))
(at-most-once (and (>= (y b14) 9) (< (y b14) 11)))
(at-most-once (and (>= (x b15) 9) (< (x b15) 11)))
(at-most-once (and (>= (y b15) 9) (< (y b15) 11)))
(at-most-once (and (>= (x b16) 9) (< (x b16) 11)))
(at-most-once (and (>= (y b16) 9) (< (y b16) 11)))
(at-most-once (and (>= (x b17) 9) (< (x b17) 11)))
(at-most-once (and (>= (y b17) 9) (< (y b17) 11)))
(at-most-once (and (>= (x b18) 9) (< (x b18) 11)))
(at-most-once (and (>= (y b18) 9) (< (y b18) 11)))
(at-most-once (and (>= (x b19) 9) (< (x b19) 11)))
(at-most-once (and (>= (y b19) 9) (< (y b19) 11)))
(at-most-once (and (>= (x b20) 9) (< (x b20) 11)))
(at-most-once (and (>= (y b20) 9) (< (y b20) 11)))
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
(at-most-once (and (>= (x b6) 11) (< (x b6) 13)))
(at-most-once (and (>= (y b6) 11) (< (y b6) 13)))
(at-most-once (and (>= (x b7) 11) (< (x b7) 13)))
(at-most-once (and (>= (y b7) 11) (< (y b7) 13)))
(at-most-once (and (>= (x b8) 11) (< (x b8) 13)))
(at-most-once (and (>= (y b8) 11) (< (y b8) 13)))
(at-most-once (and (>= (x b9) 11) (< (x b9) 13)))
(at-most-once (and (>= (y b9) 11) (< (y b9) 13)))
(at-most-once (and (>= (x b10) 11) (< (x b10) 13)))
(at-most-once (and (>= (y b10) 11) (< (y b10) 13)))
(at-most-once (and (>= (x b11) 11) (< (x b11) 13)))
(at-most-once (and (>= (y b11) 11) (< (y b11) 13)))
(at-most-once (and (>= (x b12) 11) (< (x b12) 13)))
(at-most-once (and (>= (y b12) 11) (< (y b12) 13)))
(at-most-once (and (>= (x b13) 11) (< (x b13) 13)))
(at-most-once (and (>= (y b13) 11) (< (y b13) 13)))
(at-most-once (and (>= (x b14) 11) (< (x b14) 13)))
(at-most-once (and (>= (y b14) 11) (< (y b14) 13)))
(at-most-once (and (>= (x b15) 11) (< (x b15) 13)))
(at-most-once (and (>= (y b15) 11) (< (y b15) 13)))
(at-most-once (and (>= (x b16) 11) (< (x b16) 13)))
(at-most-once (and (>= (y b16) 11) (< (y b16) 13)))
(at-most-once (and (>= (x b17) 11) (< (x b17) 13)))
(at-most-once (and (>= (y b17) 11) (< (y b17) 13)))
(at-most-once (and (>= (x b18) 11) (< (x b18) 13)))
(at-most-once (and (>= (y b18) 11) (< (y b18) 13)))
(at-most-once (and (>= (x b19) 11) (< (x b19) 13)))
(at-most-once (and (>= (y b19) 11) (< (y b19) 13)))
(at-most-once (and (>= (x b20) 11) (< (x b20) 13)))
(at-most-once (and (>= (y b20) 11) (< (y b20) 13)))
(at-most-once (and (>= (x b1) 13) (< (x b1) 16)))
(at-most-once (and (>= (y b1) 13) (< (y b1) 16)))
(at-most-once (and (>= (x b2) 13) (< (x b2) 16)))
(at-most-once (and (>= (y b2) 13) (< (y b2) 16)))
(at-most-once (and (>= (x b3) 13) (< (x b3) 16)))
(at-most-once (and (>= (y b3) 13) (< (y b3) 16)))
(at-most-once (and (>= (x b4) 13) (< (x b4) 16)))
(at-most-once (and (>= (y b4) 13) (< (y b4) 16)))
(at-most-once (and (>= (x b5) 13) (< (x b5) 16)))
(at-most-once (and (>= (y b5) 13) (< (y b5) 16)))
(at-most-once (and (>= (x b6) 13) (< (x b6) 16)))
(at-most-once (and (>= (y b6) 13) (< (y b6) 16)))
(at-most-once (and (>= (x b7) 13) (< (x b7) 16)))
(at-most-once (and (>= (y b7) 13) (< (y b7) 16)))
(at-most-once (and (>= (x b8) 13) (< (x b8) 16)))
(at-most-once (and (>= (y b8) 13) (< (y b8) 16)))
(at-most-once (and (>= (x b9) 13) (< (x b9) 16)))
(at-most-once (and (>= (y b9) 13) (< (y b9) 16)))
(at-most-once (and (>= (x b10) 13) (< (x b10) 16)))
(at-most-once (and (>= (y b10) 13) (< (y b10) 16)))
(at-most-once (and (>= (x b11) 13) (< (x b11) 16)))
(at-most-once (and (>= (y b11) 13) (< (y b11) 16)))
(at-most-once (and (>= (x b12) 13) (< (x b12) 16)))
(at-most-once (and (>= (y b12) 13) (< (y b12) 16)))
(at-most-once (and (>= (x b13) 13) (< (x b13) 16)))
(at-most-once (and (>= (y b13) 13) (< (y b13) 16)))
(at-most-once (and (>= (x b14) 13) (< (x b14) 16)))
(at-most-once (and (>= (y b14) 13) (< (y b14) 16)))
(at-most-once (and (>= (x b15) 13) (< (x b15) 16)))
(at-most-once (and (>= (y b15) 13) (< (y b15) 16)))
(at-most-once (and (>= (x b16) 13) (< (x b16) 16)))
(at-most-once (and (>= (y b16) 13) (< (y b16) 16)))
(at-most-once (and (>= (x b17) 13) (< (x b17) 16)))
(at-most-once (and (>= (y b17) 13) (< (y b17) 16)))
(at-most-once (and (>= (x b18) 13) (< (x b18) 16)))
(at-most-once (and (>= (y b18) 13) (< (y b18) 16)))
(at-most-once (and (>= (x b19) 13) (< (x b19) 16)))
(at-most-once (and (>= (y b19) 13) (< (y b19) 16)))
(at-most-once (and (>= (x b20) 13) (< (x b20) 16)))
(at-most-once (and (>= (y b20) 13) (< (y b20) 16)))))

)