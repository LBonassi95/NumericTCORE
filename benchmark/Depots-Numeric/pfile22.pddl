(define (problem depotprob1817) (:domain depot)
(:objects
	depot0 depot1 depot2 depot3 depot4 depot5 - depot
	distributor0 distributor1 distributor2 distributor3 distributor4 distributor5 - distributor
	truck0 truck1 truck2 truck3 truck4 truck5 - truck
	pallet0 pallet1 pallet2 pallet3 pallet4 pallet5 pallet6 pallet7 pallet8 pallet9 pallet10 pallet11 pallet12 pallet13 pallet14 pallet15 pallet16 pallet17 pallet18 pallet19 - pallet
	crate0 crate1 crate2 crate3 crate4 crate5 crate6 crate7 crate8 crate9 crate10 crate11 crate12 crate13 crate14 crate15 crate16 crate17 crate18 crate19 - crate
	hoist0 hoist1 hoist2 hoist3 hoist4 hoist5 hoist6 hoist7 hoist8 hoist9 hoist10 hoist11 hoist12 hoist13 hoist14 - hoist)
(:init
	(located pallet0 depot0)
	(clear crate10)
	(located pallet1 depot1)
	(clear crate17)
	(located pallet2 depot2)
	(clear pallet2)
	(located pallet3 depot3)
	(clear pallet3)
	(located pallet4 depot4)
	(clear pallet4)
	(located pallet5 depot5)
	(clear crate8)
	(located pallet6 distributor0)
	(clear pallet6)
	(located pallet7 distributor1)
	(clear crate19)
	(located pallet8 distributor2)
	(clear crate13)
	(located pallet9 distributor3)
	(clear crate16)
	(located pallet10 distributor4)
	(clear crate14)
	(located pallet11 distributor5)
	(clear crate0)
	(located pallet12 distributor4)
	(clear crate18)
	(located pallet13 distributor2)
	(clear crate15)
	(located pallet14 depot3)
	(clear pallet14)
	(located pallet15 depot3)
	(clear pallet15)
	(located pallet16 distributor1)
	(clear pallet16)
	(located pallet17 distributor2)
	(clear crate6)
	(located pallet18 distributor3)
	(clear pallet18)
	(located pallet19 distributor1)
	(clear pallet19)
	(located truck0 depot2)
	(= (current_load truck0) 0)
	(= (load_limit truck0) 443)
	(located truck1 distributor4)
	(= (current_load truck1) 0)
	(= (load_limit truck1) 222)
	(located truck2 distributor2)
	(= (current_load truck2) 0)
	(= (load_limit truck2) 267)
	(located truck3 depot0)
	(= (current_load truck3) 0)
	(= (load_limit truck3) 301)
	(located truck4 distributor3)
	(= (current_load truck4) 0)
	(= (load_limit truck4) 234)
	(located truck5 distributor0)
	(= (current_load truck5) 0)
	(= (load_limit truck5) 219)
	(located hoist0 depot0)
	(available hoist0)
	(located hoist1 depot1)
	(available hoist1)
	(located hoist2 depot2)
	(available hoist2)
	(located hoist3 depot3)
	(available hoist3)
	(located hoist4 depot4)
	(available hoist4)
	(located hoist5 depot5)
	(available hoist5)
	(located hoist6 distributor0)
	(available hoist6)
	(located hoist7 distributor1)
	(available hoist7)
	(located hoist8 distributor2)
	(available hoist8)
	(located hoist9 distributor3)
	(available hoist9)
	(located hoist10 distributor4)
	(available hoist10)
	(located hoist11 distributor5)
	(available hoist11)
	(located hoist12 depot0)
	(available hoist12)
	(located hoist13 depot5)
	(available hoist13)
	(located hoist14 depot5)
	(available hoist14)
	(located crate0 distributor5)
	(on crate0 pallet11)
	(= (weight crate0) 86)
	(located crate1 depot0)
	(on crate1 pallet0)
	(= (weight crate1) 47)
	(located crate2 distributor4)
	(on crate2 pallet10)
	(= (weight crate2) 93)
	(located crate3 distributor2)
	(on crate3 pallet8)
	(= (weight crate3) 92)
	(located crate4 distributor1)
	(on crate4 pallet7)
	(= (weight crate4) 36)
	(located crate5 distributor4)
	(on crate5 crate2)
	(= (weight crate5) 1)
	(located crate6 distributor2)
	(on crate6 pallet17)
	(= (weight crate6) 27)
	(located crate7 depot5)
	(on crate7 pallet5)
	(= (weight crate7) 37)
	(located crate8 depot5)
	(on crate8 crate7)
	(= (weight crate8) 50)
	(located crate9 depot0)
	(on crate9 crate1)
	(= (weight crate9) 60)
	(located crate10 depot0)
	(on crate10 crate9)
	(= (weight crate10) 57)
	(located crate11 distributor3)
	(on crate11 pallet9)
	(= (weight crate11) 80)
	(located crate12 depot1)
	(on crate12 pallet1)
	(= (weight crate12) 75)
	(located crate13 distributor2)
	(on crate13 crate3)
	(= (weight crate13) 76)
	(located crate14 distributor4)
	(on crate14 crate5)
	(= (weight crate14) 84)
	(located crate15 distributor2)
	(on crate15 pallet13)
	(= (weight crate15) 2)
	(located crate16 distributor3)
	(on crate16 crate11)
	(= (weight crate16) 13)
	(located crate17 depot1)
	(on crate17 crate12)
	(= (weight crate17) 70)
	(located crate18 distributor4)
	(on crate18 pallet12)
	(= (weight crate18) 2)
	(located crate19 distributor1)
	(on crate19 crate4)
	(= (weight crate19) 48)
	(= (fuel-cost) 0)
)

(:goal (and
		(on crate0 pallet14)
		(on crate1 pallet15)
		(on crate2 pallet13)
		(on crate3 pallet18)
		(on crate5 pallet12)
		(on crate6 pallet6)
		(on crate7 pallet5)
		(on crate8 crate10)
		(on crate9 pallet17)
		(on crate10 crate17)
		(on crate11 pallet1)
		(on crate12 pallet16)
		(on crate13 crate16)
		(on crate15 pallet7)
		(on crate16 crate15)
		(on crate17 pallet2)
		(on crate18 pallet4)
		(on crate19 pallet9)
	)
)



(:constraints (and (always (<= (current_load truck0) (* 0.8 (load_limit truck0))))
(sometime (>= (current_load truck0) (* 0.1 (load_limit truck0))))
(always (<= (current_load truck1) (* 0.8 (load_limit truck1))))
(sometime (>= (current_load truck1) (* 0.1 (load_limit truck1))))
(always (<= (current_load truck2) (* 0.8 (load_limit truck2))))
(sometime (>= (current_load truck2) (* 0.1 (load_limit truck2))))
(always (<= (current_load truck3) (* 0.8 (load_limit truck3))))
(sometime (>= (current_load truck3) (* 0.1 (load_limit truck3))))
(always (<= (current_load truck4) (* 0.8 (load_limit truck4))))
(sometime (>= (current_load truck4) (* 0.1 (load_limit truck4))))
(always (<= (current_load truck5) (* 0.8 (load_limit truck5))))
(sometime (>= (current_load truck5) (* 0.1 (load_limit truck5))))))

)