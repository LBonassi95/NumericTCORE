
(define (problem pfile05)
(:domain TPP-Metric)
(:objects
	market1 market2 market3 market4 market5 - market
	depot0 - depot
	truck0 - truck
	goods0 goods1 goods2 goods3 goods4 - goods)
(:init
	(= (drive-cost market1 market1) 0)
	(= (drive-cost market2 market2) 0)
	(= (drive-cost market3 market3) 0)
	(= (drive-cost market4 market4) 0)
	(= (drive-cost market5 market5) 0)
	(= (drive-cost depot0 depot0) 0)
	(= (price goods1 market1) 0)
	(= (price goods2 market1) 0)
	(= (price goods1 market2) 0)
	(= (price goods2 market3) 0)
	(= (price goods3 market3) 0)
	(= (price goods2 market4) 0)
	(= (price goods3 market4) 0)
	(= (price goods4 market4) 0)
	(= (price goods1 market5) 0)
	(= (price goods3 market5) 0)
	
	(= (price goods0 market1) 33)
	(= (on-sale goods0 market1) 4)
	(= (price goods3 market1) 25)
	(= (on-sale goods3 market1) 12)
	(= (price goods4 market1) 8)
	(= (on-sale goods4 market1) 20)
	(= (on-sale goods1 market1) 0)
	(= (on-sale goods2 market1) 0)
	(= (price goods0 market2) 42)
	(= (on-sale goods0 market2) 9)
	(= (price goods2 market2) 44)
	(= (on-sale goods2 market2) 15)
	(= (price goods3 market2) 22)
	(= (on-sale goods3 market2) 5)
	(= (price goods4 market2) 1)
	(= (on-sale goods4 market2) 11)
	(= (on-sale goods1 market2) 0)
	(= (price goods0 market3) 30)
	(= (on-sale goods0 market3) 17)
	(= (price goods1 market3) 32)
	(= (on-sale goods1 market3) 7)
	(= (price goods4 market3) 13)
	(= (on-sale goods4 market3) 2)
	(= (on-sale goods2 market3) 0)
	(= (on-sale goods3 market3) 0)
	(= (price goods0 market4) 42)
	(= (on-sale goods0 market4) 9)
	(= (price goods1 market4) 6)
	(= (on-sale goods1 market4) 20)
	(= (on-sale goods2 market4) 0)
	(= (on-sale goods3 market4) 0)
	(= (on-sale goods4 market4) 0)
	(= (price goods0 market5) 26)
	(= (on-sale goods0 market5) 2)
	(= (price goods2 market5) 3)
	(= (on-sale goods2 market5) 18)
	(= (price goods4 market5) 39)
	(= (on-sale goods4 market5) 1)
	(= (on-sale goods1 market5) 0)
	(= (on-sale goods3 market5) 0)
	(loc truck0 depot0)
	(= (drive-cost depot0 market1) 381.20)
	(= (drive-cost market1 depot0) 381.20)
	(= (drive-cost depot0 market2) 737.52)
	(= (drive-cost market2 depot0) 737.52)
	(= (drive-cost depot0 market3) 452.95)
	(= (drive-cost market3 depot0) 452.95)
	(= (drive-cost depot0 market4) 516.44)
	(= (drive-cost market4 depot0) 516.44)
	(= (drive-cost depot0 market5) 558.53)
	(= (drive-cost market5 depot0) 558.53)
	(= (drive-cost market1 market2) 1033.70)
	(= (drive-cost market2 market1) 1033.70)
	(= (drive-cost market1 market3) 227.66)
	(= (drive-cost market3 market1) 227.66)
	(= (drive-cost market1 market4) 175.31)
	(= (drive-cost market4 market1) 175.31)
	(= (drive-cost market1 market5) 458.57)
	(= (drive-cost market5 market1) 458.57)
	(= (drive-cost market2 market3) 944.03)
	(= (drive-cost market3 market2) 944.03)
	(= (drive-cost market2 market4) 1080.73)
	(= (drive-cost market4 market2) 1080.73)
	(= (drive-cost market2 market5) 826.28)
	(= (drive-cost market5 market2) 826.28)
	(= (drive-cost market3 market4) 146.54)
	(= (drive-cost market4 market3) 146.54)
	(= (drive-cost market3 market5) 237.45)
	(= (drive-cost market5 market3) 237.45)
	(= (drive-cost market4 market5) 370.71)
	(= (drive-cost market5 market4) 370.71)
	(= (bought goods0) 0)
	(= (request goods0) 21)
	(= (bought goods1) 0)
	(= (request goods1) 22)
	(= (bought goods2) 0)
	(= (request goods2) 6)
	(= (bought goods3) 0)
	(= (request goods3) 15)
	(= (bought goods4) 0)
	(= (request goods4) 32)
	(= (total-cost) 0))

(:goal (and
	(>= (bought goods0) (request goods0))
	(>= (bought goods1) (request goods1))
	(>= (bought goods2) (request goods2))
	(>= (bought goods3) (request goods3))
	(>= (bought goods4) (request goods4))
	(loc truck0 depot0)))




(:constraints (and (within 0.02 (>= (bought goods0) (request goods0)))
(within 0.02 (>= (bought goods1) (request goods1)))
(within 0.044 (>= (bought goods2) (request goods2)))
(within 0.044 (>= (bought goods3) (request goods3)))
(within 0.044 (>= (bought goods4) (request goods4)))))

)