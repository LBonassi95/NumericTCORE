(define (problem ZTRAVEL-3-10)
(:domain zenotravel)
(:objects
	plane1 - aircraft
	plane2 - aircraft
	plane3 - aircraft
	person1 - person
	person2 - person
	person3 - person
	person4 - person
	person5 - person
	person6 - person
	person7 - person
	person8 - person
	person9 - person
	person10 - person
	city0 - city
	city1 - city
	city2 - city
	city3 - city
	city4 - city
	city5 - city
	)
(:init
	(located plane1 city4)
	(= (capacity plane1) 2326)
	(= (fuel plane1) 205)
	(= (slow-burn plane1) 1)
	(= (fast-burn plane1) 2)
	(= (onboard plane1) 0)
	(= (zoom-limit plane1) 10)
	(located plane2 city3)
	(= (capacity plane2) 12132)
	(= (fuel plane2) 1469)
	(= (slow-burn plane2) 4)
	(= (fast-burn plane2) 9)
	(= (onboard plane2) 0)
	(= (zoom-limit plane2) 9)
	(located plane3 city3)
	(= (capacity plane3) 5204)
	(= (fuel plane3) 1532)
	(= (slow-burn plane3) 2)
	(= (fast-burn plane3) 7)
	(= (onboard plane3) 0)
	(= (zoom-limit plane3) 8)
	(located person1 city1)
	(located person2 city2)
	(located person3 city1)
	(located person4 city4)
	(located person5 city5)
	(located person6 city1)
	(located person7 city0)
	(located person8 city2)
	(located person9 city1)
	(located person10 city5)
	(= (distance city0 city0) 0)
	(= (distance city0 city1) 619)
	(= (distance city0 city2) 565)
	(= (distance city0 city3) 886)
	(= (distance city0 city4) 596)
	(= (distance city0 city5) 766)
	(= (distance city1 city0) 619)
	(= (distance city1 city1) 0)
	(= (distance city1 city2) 561)
	(= (distance city1 city3) 756)
	(= (distance city1 city4) 760)
	(= (distance city1 city5) 980)
	(= (distance city2 city0) 565)
	(= (distance city2 city1) 561)
	(= (distance city2 city2) 0)
	(= (distance city2 city3) 657)
	(= (distance city2 city4) 702)
	(= (distance city2 city5) 639)
	(= (distance city3 city0) 886)
	(= (distance city3 city1) 756)
	(= (distance city3 city2) 657)
	(= (distance city3 city3) 0)
	(= (distance city3 city4) 546)
	(= (distance city3 city5) 510)
	(= (distance city4 city0) 596)
	(= (distance city4 city1) 760)
	(= (distance city4 city2) 702)
	(= (distance city4 city3) 546)
	(= (distance city4 city4) 0)
	(= (distance city4 city5) 850)
	(= (distance city5 city0) 766)
	(= (distance city5 city1) 980)
	(= (distance city5 city2) 639)
	(= (distance city5 city3) 510)
	(= (distance city5 city4) 850)
	(= (distance city5 city5) 0)
	(= (total-fuel-used) 0)
)
(:goal (and
	(located plane1 city4)
	(located person1 city4)
	(located person2 city5)
	(located person3 city4)
	(located person4 city0)
	(located person5 city2)
	(located person6 city3)
	(located person8 city0)
	(located person9 city3)
	(located person10 city4)
	))




(:constraints (and (sometime (>= (onboard plane1) 1))
(sometime (>= (onboard plane2) 1))
(sometime (>= (onboard plane3) 1))

    (always 
		(forall (?p1 - aircraft) 
			(<= (onboard ?p1) 5)
		)
	)
(always (>= (fuel plane1) 205))
(always (>= (fuel plane2) 1469))
(always (>= (fuel plane3) (* 0.2 (capacity plane3))))))

)