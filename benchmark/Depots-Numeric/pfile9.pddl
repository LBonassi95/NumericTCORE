(define (problem depotprob5451) (:domain depot)
(:objects
	depot0 - depot
	distributor0 distributor1 - distributor
	truck0 truck1 - truck
	pallet0 pallet1 pallet2 pallet3 pallet4 pallet5 - pallet
	crate0 crate1 crate2 crate3 crate4 crate5 crate6 crate7 crate8 crate9 crate10 crate11 crate12 crate13 crate14 - crate
	hoist0 hoist1 hoist2 - hoist)
(:init
	(located pallet0 depot0)
	(clear crate2)
	(located pallet1 distributor0)
	(clear crate14)
	(located pallet2 distributor1)
	(clear crate13)
	(located pallet3 distributor1)
	(clear crate10)
	(located pallet4 distributor0)
	(clear crate12)
	(located pallet5 depot0)
	(clear crate8)
	(located truck0 distributor0)
	(= (current_load truck0) 0)
	(= (load_limit truck0) 314)
	(located truck1 distributor0)
	(= (current_load truck1) 0)
	(= (load_limit truck1) 246)
	(located hoist0 depot0)
	(available hoist0)
	(located hoist1 distributor0)
	(available hoist1)
	(located hoist2 distributor1)
	(available hoist2)
	(located crate0 distributor1)
	(on crate0 pallet2)
	(= (weight crate0) 13)
	(located crate1 depot0)
	(on crate1 pallet0)
	(= (weight crate1) 94)
	(located crate2 depot0)
	(on crate2 crate1)
	(= (weight crate2) 45)
	(located crate3 distributor0)
	(on crate3 pallet1)
	(= (weight crate3) 26)
	(located crate4 distributor1)
	(on crate4 crate0)
	(= (weight crate4) 96)
	(located crate5 distributor1)
	(on crate5 pallet3)
	(= (weight crate5) 74)
	(located crate6 distributor0)
	(on crate6 crate3)
	(= (weight crate6) 68)
	(located crate7 distributor0)
	(on crate7 crate6)
	(= (weight crate7) 71)
	(located crate8 depot0)
	(on crate8 pallet5)
	(= (weight crate8) 81)
	(located crate9 distributor0)
	(on crate9 crate7)
	(= (weight crate9) 51)
	(located crate10 distributor1)
	(on crate10 crate5)
	(= (weight crate10) 94)
	(located crate11 distributor0)
	(on crate11 pallet4)
	(= (weight crate11) 36)
	(located crate12 distributor0)
	(on crate12 crate11)
	(= (weight crate12) 70)
	(located crate13 distributor1)
	(on crate13 crate4)
	(= (weight crate13) 66)
	(located crate14 distributor0)
	(on crate14 crate9)
	(= (weight crate14) 55)
	(= (fuel-cost) 0)
)

(:goal (and
		(on crate0 crate5)
		(on crate1 crate2)
		(on crate2 crate10)
		(on crate3 pallet0)
		(on crate4 crate6)
		(on crate5 pallet5)
		(on crate6 pallet4)
		(on crate9 crate1)
		(on crate10 pallet2)
		(on crate11 pallet1)
		(on crate12 crate14)
		(on crate13 crate3)
		(on crate14 pallet3)
	)
)



(:constraints (and (always (<= (current_load truck0) (* 0.8 (load_limit truck0))))
(sometime (>= (current_load truck0) (* 0.1 (load_limit truck0))))
(always (<= (current_load truck1) (* 0.8 (load_limit truck1))))
(sometime (>= (current_load truck1) (* 0.1 (load_limit truck1))))))

)