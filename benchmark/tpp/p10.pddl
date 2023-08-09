
(define (problem pfile10)
(:domain TPP-Metric)
(:objects
	market1 market2 market3 market4 market5 market6 market7 market8 market9 market10 - market
	depot0 - depot
	truck0 - truck
	goods0 goods1 goods2 goods3 goods4 goods5 goods6 goods7 goods8 goods9 - goods)
(:init
	(= (drive-cost market1 market1) 0)
	(= (drive-cost market2 market2) 0)
	(= (drive-cost market3 market3) 0)
	(= (drive-cost market4 market4) 0)
	(= (drive-cost market5 market5) 0)
	(= (drive-cost market6 market6) 0)
	(= (drive-cost market7 market7) 0)
	(= (drive-cost market8 market8) 0)
	(= (drive-cost market9 market9) 0)
	(= (drive-cost market10 market10) 0)
	(= (drive-cost depot0 depot0) 0)
	(= (price goods0 market1) 0)
	(= (price goods7 market1) 0)
	(= (price goods0 market2) 0)
	(= (price goods5 market2) 0)
	(= (price goods6 market2) 0)
	(= (price goods7 market2) 0)
	(= (price goods8 market2) 0)
	(= (price goods1 market3) 0)
	(= (price goods3 market3) 0)
	(= (price goods4 market3) 0)
	(= (price goods6 market3) 0)
	(= (price goods7 market3) 0)
	(= (price goods8 market3) 0)
	(= (price goods1 market4) 0)
	(= (price goods4 market4) 0)
	(= (price goods6 market4) 0)
	(= (price goods7 market4) 0)
	(= (price goods8 market4) 0)
	(= (price goods0 market5) 0)
	(= (price goods1 market5) 0)
	(= (price goods2 market5) 0)
	(= (price goods3 market5) 0)
	(= (price goods5 market5) 0)
	(= (price goods8 market5) 0)
	(= (price goods9 market5) 0)
	(= (price goods1 market6) 0)
	(= (price goods4 market6) 0)
	(= (price goods5 market6) 0)
	(= (price goods7 market6) 0)
	(= (price goods9 market6) 0)
	(= (price goods0 market7) 0)
	(= (price goods1 market7) 0)
	(= (price goods6 market7) 0)
	(= (price goods8 market7) 0)
	(= (price goods2 market8) 0)
	(= (price goods4 market8) 0)
	(= (price goods6 market8) 0)
	(= (price goods8 market8) 0)
	(= (price goods0 market9) 0)
	(= (price goods4 market9) 0)
	(= (price goods5 market9) 0)
	(= (price goods6 market9) 0)
	(= (price goods9 market9) 0)
	(= (price goods0 market10) 0)
	(= (price goods1 market10) 0)
	(= (price goods2 market10) 0)
	(= (price goods3 market10) 0)
	(= (price goods6 market10) 0)
	(= (price goods8 market10) 0)
	
	(= (price goods1 market1) 26)
	(= (on-sale goods1 market1) 12)
	(= (price goods2 market1) 26)
	(= (on-sale goods2 market1) 6)
	(= (price goods3 market1) 32)
	(= (on-sale goods3 market1) 13)
	(= (price goods4 market1) 10)
	(= (on-sale goods4 market1) 4)
	(= (price goods5 market1) 27)
	(= (on-sale goods5 market1) 13)
	(= (price goods6 market1) 31)
	(= (on-sale goods6 market1) 11)
	(= (price goods8 market1) 47)
	(= (on-sale goods8 market1) 13)
	(= (price goods9 market1) 20)
	(= (on-sale goods9 market1) 4)
	(= (on-sale goods0 market1) 0)
	(= (on-sale goods7 market1) 0)
	(= (price goods1 market2) 30)
	(= (on-sale goods1 market2) 5)
	(= (price goods2 market2) 21)
	(= (on-sale goods2 market2) 1)
	(= (price goods3 market2) 50)
	(= (on-sale goods3 market2) 16)
	(= (price goods4 market2) 8)
	(= (on-sale goods4 market2) 20)
	(= (price goods9 market2) 3)
	(= (on-sale goods9 market2) 10)
	(= (on-sale goods0 market2) 0)
	(= (on-sale goods5 market2) 0)
	(= (on-sale goods6 market2) 0)
	(= (on-sale goods7 market2) 0)
	(= (on-sale goods8 market2) 0)
	(= (price goods0 market3) 28)
	(= (on-sale goods0 market3) 7)
	(= (price goods2 market3) 45)
	(= (on-sale goods2 market3) 6)
	(= (price goods5 market3) 11)
	(= (on-sale goods5 market3) 4)
	(= (price goods9 market3) 10)
	(= (on-sale goods9 market3) 2)
	(= (on-sale goods1 market3) 0)
	(= (on-sale goods3 market3) 0)
	(= (on-sale goods4 market3) 0)
	(= (on-sale goods6 market3) 0)
	(= (on-sale goods7 market3) 0)
	(= (on-sale goods8 market3) 0)
	(= (price goods0 market4) 44)
	(= (on-sale goods0 market4) 20)
	(= (price goods2 market4) 29)
	(= (on-sale goods2 market4) 3)
	(= (price goods3 market4) 27)
	(= (on-sale goods3 market4) 11)
	(= (price goods5 market4) 22)
	(= (on-sale goods5 market4) 11)
	(= (price goods9 market4) 43)
	(= (on-sale goods9 market4) 6)
	(= (on-sale goods1 market4) 0)
	(= (on-sale goods4 market4) 0)
	(= (on-sale goods6 market4) 0)
	(= (on-sale goods7 market4) 0)
	(= (on-sale goods8 market4) 0)
	(= (price goods4 market5) 9)
	(= (on-sale goods4 market5) 17)
	(= (price goods6 market5) 1)
	(= (on-sale goods6 market5) 10)
	(= (price goods7 market5) 44)
	(= (on-sale goods7 market5) 18)
	(= (on-sale goods0 market5) 0)
	(= (on-sale goods1 market5) 0)
	(= (on-sale goods2 market5) 0)
	(= (on-sale goods3 market5) 0)
	(= (on-sale goods5 market5) 0)
	(= (on-sale goods8 market5) 0)
	(= (on-sale goods9 market5) 0)
	(= (price goods0 market6) 4)
	(= (on-sale goods0 market6) 18)
	(= (price goods2 market6) 32)
	(= (on-sale goods2 market6) 2)
	(= (price goods3 market6) 3)
	(= (on-sale goods3 market6) 4)
	(= (price goods6 market6) 22)
	(= (on-sale goods6 market6) 17)
	(= (price goods8 market6) 28)
	(= (on-sale goods8 market6) 1)
	(= (on-sale goods1 market6) 0)
	(= (on-sale goods4 market6) 0)
	(= (on-sale goods5 market6) 0)
	(= (on-sale goods7 market6) 0)
	(= (on-sale goods9 market6) 0)
	(= (price goods2 market7) 5)
	(= (on-sale goods2 market7) 2)
	(= (price goods3 market7) 47)
	(= (on-sale goods3 market7) 7)
	(= (price goods4 market7) 3)
	(= (on-sale goods4 market7) 16)
	(= (price goods5 market7) 36)
	(= (on-sale goods5 market7) 11)
	(= (price goods7 market7) 7)
	(= (on-sale goods7 market7) 5)
	(= (price goods9 market7) 31)
	(= (on-sale goods9 market7) 9)
	(= (on-sale goods0 market7) 0)
	(= (on-sale goods1 market7) 0)
	(= (on-sale goods6 market7) 0)
	(= (on-sale goods8 market7) 0)
	(= (price goods0 market8) 19)
	(= (on-sale goods0 market8) 15)
	(= (price goods1 market8) 5)
	(= (on-sale goods1 market8) 20)
	(= (price goods3 market8) 3)
	(= (on-sale goods3 market8) 2)
	(= (price goods5 market8) 48)
	(= (on-sale goods5 market8) 1)
	(= (price goods7 market8) 25)
	(= (on-sale goods7 market8) 14)
	(= (price goods9 market8) 2)
	(= (on-sale goods9 market8) 20)
	(= (on-sale goods2 market8) 0)
	(= (on-sale goods4 market8) 0)
	(= (on-sale goods6 market8) 0)
	(= (on-sale goods8 market8) 0)
	(= (price goods1 market9) 7)
	(= (on-sale goods1 market9) 2)
	(= (price goods2 market9) 27)
	(= (on-sale goods2 market9) 12)
	(= (price goods3 market9) 29)
	(= (on-sale goods3 market9) 10)
	(= (price goods7 market9) 1)
	(= (on-sale goods7 market9) 6)
	(= (price goods8 market9) 40)
	(= (on-sale goods8 market9) 10)
	(= (on-sale goods0 market9) 0)
	(= (on-sale goods4 market9) 0)
	(= (on-sale goods5 market9) 0)
	(= (on-sale goods6 market9) 0)
	(= (on-sale goods9 market9) 0)
	(= (price goods4 market10) 40)
	(= (on-sale goods4 market10) 6)
	(= (price goods5 market10) 46)
	(= (on-sale goods5 market10) 19)
	(= (price goods7 market10) 18)
	(= (on-sale goods7 market10) 18)
	(= (price goods9 market10) 16)
	(= (on-sale goods9 market10) 7)
	(= (on-sale goods0 market10) 0)
	(= (on-sale goods1 market10) 0)
	(= (on-sale goods2 market10) 0)
	(= (on-sale goods3 market10) 0)
	(= (on-sale goods6 market10) 0)
	(= (on-sale goods8 market10) 0)
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
	(= (drive-cost depot0 market6) 108.58)
	(= (drive-cost market6 depot0) 108.58)
	(= (drive-cost depot0 market7) 505.36)
	(= (drive-cost market7 depot0) 505.36)
	(= (drive-cost depot0 market8) 550.41)
	(= (drive-cost market8 depot0) 550.41)
	(= (drive-cost depot0 market9) 240.86)
	(= (drive-cost market9 depot0) 240.86)
	(= (drive-cost depot0 market10) 495.59)
	(= (drive-cost market10 depot0) 495.59)
	(= (drive-cost market1 market2) 1033.70)
	(= (drive-cost market2 market1) 1033.70)
	(= (drive-cost market1 market3) 227.66)
	(= (drive-cost market3 market1) 227.66)
	(= (drive-cost market1 market4) 175.31)
	(= (drive-cost market4 market1) 175.31)
	(= (drive-cost market1 market5) 458.57)
	(= (drive-cost market5 market1) 458.57)
	(= (drive-cost market1 market6) 481.77)
	(= (drive-cost market6 market1) 481.77)
	(= (drive-cost market1 market7) 212.51)
	(= (drive-cost market7 market1) 212.51)
	(= (drive-cost market1 market8) 827.23)
	(= (drive-cost market8 market1) 827.23)
	(= (drive-cost market1 market9) 163.69)
	(= (drive-cost market9 market1) 163.69)
	(= (drive-cost market1 market10) 145.50)
	(= (drive-cost market10 market1) 145.50)
	(= (drive-cost market2 market3) 944.03)
	(= (drive-cost market3 market2) 944.03)
	(= (drive-cost market2 market4) 1080.73)
	(= (drive-cost market4 market2) 1080.73)
	(= (drive-cost market2 market5) 826.28)
	(= (drive-cost market5 market2) 826.28)
	(= (drive-cost market2 market6) 638.60)
	(= (drive-cost market6 market2) 638.60)
	(= (drive-cost market2 market7) 1025.31)
	(= (drive-cost market7 market2) 1025.31)
	(= (drive-cost market2 market8) 208.06)
	(= (drive-cost market8 market2) 208.06)
	(= (drive-cost market2 market9) 871.85)
	(= (drive-cost market9 market2) 871.85)
	(= (drive-cost market2 market10) 1077.51)
	(= (drive-cost market10 market2) 1077.51)
	(= (drive-cost market3 market4) 146.54)
	(= (drive-cost market4 market3) 146.54)
	(= (drive-cost market3 market5) 237.45)
	(= (drive-cost market5 market3) 237.45)
	(= (drive-cost market3 market6) 522.61)
	(= (drive-cost market6 market3) 522.61)
	(= (drive-cost market3 market7) 81.47)
	(= (drive-cost market7 market3) 81.47)
	(= (drive-cost market3 market8) 737.35)
	(= (drive-cost market8 market3) 737.35)
	(= (drive-cost market3 market9) 227.18)
	(= (drive-cost market9 market3) 227.18)
	(= (drive-cost market3 market10) 156.31)
	(= (drive-cost market10 market3) 156.31)
	(= (drive-cost market4 market5) 370.71)
	(= (drive-cost market5 market4) 370.71)
	(= (drive-cost market4 market6) 604.20)
	(= (drive-cost market6 market4) 604.20)
	(= (drive-cost market4 market7) 74.06)
	(= (drive-cost market7 market4) 74.06)
	(= (drive-cost market4 market8) 872.98)
	(= (drive-cost market8 market4) 872.98)
	(= (drive-cost market4 market9) 275.75)
	(= (drive-cost market9 market4) 275.75)
	(= (drive-cost market4 market10) 30.81)
	(= (drive-cost market10 market4) 30.81)
	(= (drive-cost market5 market6) 587.93)
	(= (drive-cost market6 market5) 587.93)
	(= (drive-cost market5 market7) 296.67)
	(= (drive-cost market7 market5) 296.67)
	(= (drive-cost market5 market8) 633.55)
	(= (drive-cost market8 market5) 633.55)
	(= (drive-cost market5 market9) 399.51)
	(= (drive-cost market9 market5) 399.51)
	(= (drive-cost market5 market10) 388.01)
	(= (drive-cost market10 market5) 388.01)
	(= (drive-cost market6 market7) 583.98)
	(= (drive-cost market7 market6) 583.98)
	(= (drive-cost market6 market8) 460.43)
	(= (drive-cost market8 market6) 460.43)
	(= (drive-cost market6 market9) 330.55)
	(= (drive-cost market9 market6) 330.55)
	(= (drive-cost market6 market10) 586.04)
	(= (drive-cost market10 market6) 586.04)
	(= (drive-cost market7 market8) 818.46)
	(= (drive-cost market8 market7) 818.46)
	(= (drive-cost market7 market9) 267.61)
	(= (drive-cost market9 market7) 267.61)
	(= (drive-cost market7 market10) 94.59)
	(= (drive-cost market10 market7) 94.59)
	(= (drive-cost market8 market9) 666.32)
	(= (drive-cost market9 market8) 666.32)
	(= (drive-cost market8 market10) 869.51)
	(= (drive-cost market10 market8) 869.51)
	(= (drive-cost market9 market10) 255.93)
	(= (drive-cost market10 market9) 255.93)
	(= (bought goods0) 0)
	(= (request goods0) 4)
	(= (bought goods1) 0)
	(= (request goods1) 10)
	(= (bought goods2) 0)
	(= (request goods2) 8)
	(= (bought goods3) 0)
	(= (request goods3) 16)
	(= (bought goods4) 0)
	(= (request goods4) 44)
	(= (bought goods5) 0)
	(= (request goods5) 15)
	(= (bought goods6) 0)
	(= (request goods6) 14)
	(= (bought goods7) 0)
	(= (request goods7) 58)
	(= (bought goods8) 0)
	(= (request goods8) 16)
	(= (bought goods9) 0)
	(= (request goods9) 17)
	(= (total-cost) 0))

(:goal (and
	(>= (bought goods0) (request goods0))
	(>= (bought goods1) (request goods1))
	(>= (bought goods2) (request goods2))
	(>= (bought goods3) (request goods3))
	(>= (bought goods4) (request goods4))
	(>= (bought goods5) (request goods5))
	(>= (bought goods6) (request goods6))
	(>= (bought goods7) (request goods7))
	(>= (bought goods8) (request goods8))
	(>= (bought goods9) (request goods9))
	(loc truck0 depot0)))




(:constraints (and (within 100 (>= (bought goods0) (request goods0)))
(within 100 (>= (bought goods1) (request goods1)))
(within 100 (>= (bought goods2) (request goods2)))
(within 100 (>= (bought goods3) (request goods3)))
(within 100 (>= (bought goods4) (request goods4)))
(within 200 (>= (bought goods5) (request goods5)))
(within 200 (>= (bought goods6) (request goods6)))
(within 200 (>= (bought goods7) (request goods7)))
(within 200 (>= (bought goods8) (request goods8)))
(within 200 (>= (bought goods9) (request goods9)))))

)