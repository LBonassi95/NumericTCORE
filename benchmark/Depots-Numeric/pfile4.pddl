(define (problem depotprob6512) (:domain depot)
(:objects
	depot0 - depot
	distributor0 distributor1 - distributor
	truck0 truck1 - truck
	pallet0 pallet1 pallet2 - pallet
	crate0 crate1 crate2 crate3 crate4 crate5 crate6 crate7 - crate
	hoist0 hoist1 hoist2 - hoist)
(:init
	(located pallet0 depot0)
	(clear crate7)
	(located pallet1 distributor0)
	(clear crate2)
	(located pallet2 distributor1)
	(clear crate6)
	(located truck0 distributor1)
	(= (current_load truck0) 0)
	(= (load_limit truck0) 420)
	(located truck1 distributor1)
	(= (current_load truck1) 0)
	(= (load_limit truck1) 233)
	(located hoist0 depot0)
	(available hoist0)
	(located hoist1 distributor0)
	(available hoist1)
	(located hoist2 distributor1)
	(available hoist2)
	(located crate0 depot0)
	(on crate0 pallet0)
	(= (weight crate0) 6)
	(located crate1 depot0)
	(on crate1 crate0)
	(= (weight crate1) 22)
	(located crate2 distributor0)
	(on crate2 pallet1)
	(= (weight crate2) 23)
	(located crate3 distributor1)
	(on crate3 pallet2)
	(= (weight crate3) 87)
	(located crate4 depot0)
	(on crate4 crate1)
	(= (weight crate4) 89)
	(located crate5 distributor1)
	(on crate5 crate3)
	(= (weight crate5) 50)
	(located crate6 distributor1)
	(on crate6 crate5)
	(= (weight crate6) 18)
	(located crate7 depot0)
	(on crate7 crate4)
	(= (weight crate7) 93)
	(= (fuel-cost) 0)
)

(:goal (and
		(on crate0 crate4)
		(on crate2 crate6)
		(on crate4 crate7)
		(on crate5 pallet2)
		(on crate6 pallet1)
		(on crate7 pallet0)
	)
)



(:constraints (and (always (<= (current_load truck0) (* 0.8 (load_limit truck0))))
(sometime (>= (current_load truck0) (* 0.1 (load_limit truck0))))
(always (<= (current_load truck1) (* 0.8 (load_limit truck1))))
(sometime (>= (current_load truck1) (* 0.1 (load_limit truck1))))))

)