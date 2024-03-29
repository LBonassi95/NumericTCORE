(define (problem depotprob8715) (:domain depot)
(:objects
	depot0 depot1 depot2 depot3 depot4 depot5 - depot
	distributor0 distributor1 distributor2 distributor3 distributor4 distributor5 - distributor
	truck0 truck1 truck2 truck3 truck4 truck5 - truck
	pallet0 pallet1 pallet2 pallet3 pallet4 pallet5 pallet6 pallet7 pallet8 pallet9 pallet10 pallet11 pallet12 pallet13 pallet14 pallet15 pallet16 pallet17 pallet18 pallet19 - pallet
	crate0 crate1 crate2 crate3 crate4 crate5 crate6 crate7 crate8 crate9 - crate
	hoist0 hoist1 hoist2 hoist3 hoist4 hoist5 hoist6 hoist7 hoist8 hoist9 hoist10 hoist11 hoist12 hoist13 hoist14 - hoist)
(:init
	(located pallet0 depot0)
	(clear crate1)
	(located pallet1 depot1)
	(clear crate5)
	(located pallet2 depot2)
	(clear pallet2)
	(located pallet3 depot3)
	(clear pallet3)
	(located pallet4 depot4)
	(clear crate6)
	(located pallet5 depot5)
	(clear pallet5)
	(located pallet6 distributor0)
	(clear pallet6)
	(located pallet7 distributor1)
	(clear crate8)
	(located pallet8 distributor2)
	(clear crate4)
	(located pallet9 distributor3)
	(clear pallet9)
	(located pallet10 distributor4)
	(clear pallet10)
	(located pallet11 distributor5)
	(clear pallet11)
	(located pallet12 distributor1)
	(clear pallet12)
	(located pallet13 distributor5)
	(clear crate2)
	(located pallet14 depot2)
	(clear pallet14)
	(located pallet15 depot1)
	(clear crate3)
	(located pallet16 depot1)
	(clear crate0)
	(located pallet17 distributor2)
	(clear pallet17)
	(located pallet18 depot4)
	(clear crate7)
	(located pallet19 depot1)
	(clear crate9)
	(located truck0 distributor2)
	(= (current_load truck0) 0)
	(= (load_limit truck0) 399)
	(located truck1 depot0)
	(= (current_load truck1) 0)
	(= (load_limit truck1) 340)
	(located truck2 distributor3)
	(= (current_load truck2) 0)
	(= (load_limit truck2) 258)
	(located truck3 distributor0)
	(= (current_load truck3) 0)
	(= (load_limit truck3) 264)
	(located truck4 depot0)
	(= (current_load truck4) 0)
	(= (load_limit truck4) 272)
	(located truck5 depot4)
	(= (current_load truck5) 0)
	(= (load_limit truck5) 397)
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
	(located hoist12 depot5)
	(available hoist12)
	(located hoist13 depot1)
	(available hoist13)
	(located hoist14 depot4)
	(available hoist14)
	(located crate0 depot1)
	(on crate0 pallet16)
	(= (weight crate0) 13)
	(located crate1 depot0)
	(on crate1 pallet0)
	(= (weight crate1) 25)
	(located crate2 distributor5)
	(on crate2 pallet13)
	(= (weight crate2) 64)
	(located crate3 depot1)
	(on crate3 pallet15)
	(= (weight crate3) 5)
	(located crate4 distributor2)
	(on crate4 pallet8)
	(= (weight crate4) 92)
	(located crate5 depot1)
	(on crate5 pallet1)
	(= (weight crate5) 95)
	(located crate6 depot4)
	(on crate6 pallet4)
	(= (weight crate6) 32)
	(located crate7 depot4)
	(on crate7 pallet18)
	(= (weight crate7) 7)
	(located crate8 distributor1)
	(on crate8 pallet7)
	(= (weight crate8) 8)
	(located crate9 depot1)
	(on crate9 pallet19)
	(= (weight crate9) 24)
	(= (fuel-cost) 0)
)

(:goal (and
		(on crate0 pallet2)
		(on crate1 pallet7)
		(on crate2 pallet11)
		(on crate3 pallet3)
		(on crate5 pallet5)
		(on crate6 pallet12)
		(on crate7 pallet18)
		(on crate8 pallet15)
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