;; Enrico Scala (enricos83@gmail.com) and Miquel Ramirez (miquel.ramirez@gmail.com)
;;Setting seed to 1229
(define (problem instance_3_10_1229)

	(:domain sailing)

	(:objects
		b0 b1 b2  - boat
		p0 p1 p2 p3 p4 p5 p6 p7 p8 p9  - person
	)

  (:init
		(= (x b0) -5)
(= (y b0) 0)
(= (x b1) 1)
(= (y b1) 0)
(= (x b2) -7)
(= (y b2) 0)


		(= (d p0) -370)
(= (d p1) -58)
(= (d p2) 63)
(= (d p3) 483)
(= (d p4) 223)
(= (d p5) 316)
(= (d p6) -394)
(= (d p7) -242)
(= (d p8) -160)
(= (d p9) -338)


	)

	(:goal
		(and
			(saved p0)
(saved p1)
(saved p2)
(saved p3)
(saved p4)
(saved p5)
(saved p6)
(saved p7)
(saved p8)
(saved p9)

		)
	)

	(:constraints (and
		(sometime-before (saved p1) (saved p0))
(sometime-before (saved p2) (saved p1))
(sometime-before (saved p3) (saved p2))
(sometime-before (saved p4) (saved p3))
(sometime-before (saved p5) (saved p4))
(sometime-before (saved p6) (saved p5))
(sometime-before (saved p7) (saved p6))
(sometime-before (saved p8) (saved p7))
(sometime-before (saved p9) (saved p8))
	))
)


