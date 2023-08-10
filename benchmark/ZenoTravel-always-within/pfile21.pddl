(define (problem ZTRAVEL-5-30)
(:domain zenotravel)
(:objects
	plane1 - aircraft
	plane2 - aircraft
	plane3 - aircraft
	plane4 - aircraft
	plane5 - aircraft
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
	person11 - person
	person12 - person
	person13 - person
	person14 - person
	person15 - person
	person16 - person
	person17 - person
	person18 - person
	person19 - person
	person20 - person
	person21 - person
	person22 - person
	person23 - person
	person24 - person
	person25 - person
	person26 - person
	person27 - person
	person28 - person
	person29 - person
	person30 - person
	city0 - city
	city1 - city
	city2 - city
	city3 - city
	city4 - city
	city5 - city
	city6 - city
	city7 - city
	city8 - city
	city9 - city
	city10 - city
	city11 - city
	city12 - city
	city13 - city
	city14 - city
	city15 - city
	city16 - city
	city17 - city
	city18 - city
	city19 - city
	city20 - city
	city21 - city
	city22 - city
	city23 - city
	city24 - city
	)
(:init
	(located plane1 city23)
	(= (capacity plane1) 264)
	(= (fuel plane1) 9)
	(= (slow-burn plane1) 2)
	(= (fast-burn plane1) 4)
	(= (onboard plane1) 0)
	(= (zoom-limit plane1) 2)
	(located plane2 city5)
	(= (capacity plane2) 289)
	(= (fuel plane2) 96)
	(= (slow-burn plane2) 2)
	(= (fast-burn plane2) 4)
	(= (onboard plane2) 0)
	(= (zoom-limit plane2) 6)
	(located plane3 city3)
	(= (capacity plane3) 346)
	(= (fuel plane3) 18)
	(= (slow-burn plane3) 3)
	(= (fast-burn plane3) 11)
	(= (onboard plane3) 0)
	(= (zoom-limit plane3) 5)
	(located plane4 city18)
	(= (capacity plane4) 558)
	(= (fuel plane4) 108)
	(= (slow-burn plane4) 4)
	(= (fast-burn plane4) 13)
	(= (onboard plane4) 0)
	(= (zoom-limit plane4) 8)
	(located plane5 city10)
	(= (capacity plane5) 252)
	(= (fuel plane5) 48)
	(= (slow-burn plane5) 2)
	(= (fast-burn plane5) 4)
	(= (onboard plane5) 0)
	(= (zoom-limit plane5) 10)
	(located person1 city14)
	(located person2 city19)
	(located person3 city6)
	(located person4 city0)
	(located person5 city7)
	(located person6 city22)
	(located person7 city17)
	(located person8 city19)
	(located person9 city6)
	(located person10 city7)
	(located person11 city8)
	(located person12 city12)
	(located person13 city13)
	(located person14 city2)
	(located person15 city7)
	(located person16 city4)
	(located person17 city4)
	(located person18 city15)
	(located person19 city7)
	(located person20 city18)
	(located person21 city3)
	(located person22 city23)
	(located person23 city16)
	(located person24 city16)
	(located person25 city15)
	(located person26 city0)
	(located person27 city13)
	(located person28 city14)
	(located person29 city14)
	(located person30 city21)
	(= (distance city0 city0) 0)
	(= (distance city0 city1) 33)
	(= (distance city0 city2) 38)
	(= (distance city0 city3) 40)
	(= (distance city0 city4) 27)
	(= (distance city0 city5) 37)
	(= (distance city0 city6) 44)
	(= (distance city0 city7) 49)
	(= (distance city0 city8) 49)
	(= (distance city0 city9) 36)
	(= (distance city0 city10) 40)
	(= (distance city0 city11) 48)
	(= (distance city0 city12) 34)
	(= (distance city0 city13) 44)
	(= (distance city0 city14) 43)
	(= (distance city0 city15) 26)
	(= (distance city0 city16) 27)
	(= (distance city0 city17) 39)
	(= (distance city0 city18) 43)
	(= (distance city0 city19) 42)
	(= (distance city0 city20) 45)
	(= (distance city0 city21) 45)
	(= (distance city0 city22) 44)
	(= (distance city0 city23) 44)
	(= (distance city0 city24) 39)
	(= (distance city1 city0) 33)
	(= (distance city1 city1) 0)
	(= (distance city1 city2) 41)
	(= (distance city1 city3) 32)
	(= (distance city1 city4) 42)
	(= (distance city1 city5) 26)
	(= (distance city1 city6) 38)
	(= (distance city1 city7) 31)
	(= (distance city1 city8) 40)
	(= (distance city1 city9) 47)
	(= (distance city1 city10) 45)
	(= (distance city1 city11) 30)
	(= (distance city1 city12) 49)
	(= (distance city1 city13) 32)
	(= (distance city1 city14) 25)
	(= (distance city1 city15) 48)
	(= (distance city1 city16) 32)
	(= (distance city1 city17) 36)
	(= (distance city1 city18) 39)
	(= (distance city1 city19) 30)
	(= (distance city1 city20) 46)
	(= (distance city1 city21) 33)
	(= (distance city1 city22) 48)
	(= (distance city1 city23) 47)
	(= (distance city1 city24) 36)
	(= (distance city2 city0) 38)
	(= (distance city2 city1) 41)
	(= (distance city2 city2) 0)
	(= (distance city2 city3) 38)
	(= (distance city2 city4) 40)
	(= (distance city2 city5) 29)
	(= (distance city2 city6) 33)
	(= (distance city2 city7) 36)
	(= (distance city2 city8) 48)
	(= (distance city2 city9) 28)
	(= (distance city2 city10) 25)
	(= (distance city2 city11) 39)
	(= (distance city2 city12) 35)
	(= (distance city2 city13) 43)
	(= (distance city2 city14) 41)
	(= (distance city2 city15) 49)
	(= (distance city2 city16) 49)
	(= (distance city2 city17) 31)
	(= (distance city2 city18) 46)
	(= (distance city2 city19) 45)
	(= (distance city2 city20) 37)
	(= (distance city2 city21) 45)
	(= (distance city2 city22) 27)
	(= (distance city2 city23) 37)
	(= (distance city2 city24) 44)
	(= (distance city3 city0) 40)
	(= (distance city3 city1) 32)
	(= (distance city3 city2) 38)
	(= (distance city3 city3) 0)
	(= (distance city3 city4) 35)
	(= (distance city3 city5) 49)
	(= (distance city3 city6) 33)
	(= (distance city3 city7) 40)
	(= (distance city3 city8) 45)
	(= (distance city3 city9) 42)
	(= (distance city3 city10) 39)
	(= (distance city3 city11) 43)
	(= (distance city3 city12) 29)
	(= (distance city3 city13) 28)
	(= (distance city3 city14) 34)
	(= (distance city3 city15) 33)
	(= (distance city3 city16) 36)
	(= (distance city3 city17) 46)
	(= (distance city3 city18) 31)
	(= (distance city3 city19) 39)
	(= (distance city3 city20) 46)
	(= (distance city3 city21) 46)
	(= (distance city3 city22) 25)
	(= (distance city3 city23) 39)
	(= (distance city3 city24) 37)
	(= (distance city4 city0) 27)
	(= (distance city4 city1) 42)
	(= (distance city4 city2) 40)
	(= (distance city4 city3) 35)
	(= (distance city4 city4) 0)
	(= (distance city4 city5) 49)
	(= (distance city4 city6) 39)
	(= (distance city4 city7) 44)
	(= (distance city4 city8) 46)
	(= (distance city4 city9) 34)
	(= (distance city4 city10) 32)
	(= (distance city4 city11) 41)
	(= (distance city4 city12) 37)
	(= (distance city4 city13) 45)
	(= (distance city4 city14) 35)
	(= (distance city4 city15) 47)
	(= (distance city4 city16) 44)
	(= (distance city4 city17) 44)
	(= (distance city4 city18) 38)
	(= (distance city4 city19) 40)
	(= (distance city4 city20) 37)
	(= (distance city4 city21) 28)
	(= (distance city4 city22) 34)
	(= (distance city4 city23) 41)
	(= (distance city4 city24) 31)
	(= (distance city5 city0) 37)
	(= (distance city5 city1) 26)
	(= (distance city5 city2) 29)
	(= (distance city5 city3) 49)
	(= (distance city5 city4) 49)
	(= (distance city5 city5) 0)
	(= (distance city5 city6) 44)
	(= (distance city5 city7) 49)
	(= (distance city5 city8) 43)
	(= (distance city5 city9) 40)
	(= (distance city5 city10) 31)
	(= (distance city5 city11) 33)
	(= (distance city5 city12) 36)
	(= (distance city5 city13) 28)
	(= (distance city5 city14) 34)
	(= (distance city5 city15) 26)
	(= (distance city5 city16) 40)
	(= (distance city5 city17) 34)
	(= (distance city5 city18) 41)
	(= (distance city5 city19) 35)
	(= (distance city5 city20) 30)
	(= (distance city5 city21) 26)
	(= (distance city5 city22) 42)
	(= (distance city5 city23) 46)
	(= (distance city5 city24) 38)
	(= (distance city6 city0) 44)
	(= (distance city6 city1) 38)
	(= (distance city6 city2) 33)
	(= (distance city6 city3) 33)
	(= (distance city6 city4) 39)
	(= (distance city6 city5) 44)
	(= (distance city6 city6) 0)
	(= (distance city6 city7) 37)
	(= (distance city6 city8) 32)
	(= (distance city6 city9) 36)
	(= (distance city6 city10) 32)
	(= (distance city6 city11) 26)
	(= (distance city6 city12) 25)
	(= (distance city6 city13) 48)
	(= (distance city6 city14) 39)
	(= (distance city6 city15) 29)
	(= (distance city6 city16) 32)
	(= (distance city6 city17) 30)
	(= (distance city6 city18) 36)
	(= (distance city6 city19) 27)
	(= (distance city6 city20) 30)
	(= (distance city6 city21) 29)
	(= (distance city6 city22) 42)
	(= (distance city6 city23) 37)
	(= (distance city6 city24) 38)
	(= (distance city7 city0) 49)
	(= (distance city7 city1) 31)
	(= (distance city7 city2) 36)
	(= (distance city7 city3) 40)
	(= (distance city7 city4) 44)
	(= (distance city7 city5) 49)
	(= (distance city7 city6) 37)
	(= (distance city7 city7) 0)
	(= (distance city7 city8) 29)
	(= (distance city7 city9) 40)
	(= (distance city7 city10) 47)
	(= (distance city7 city11) 31)
	(= (distance city7 city12) 31)
	(= (distance city7 city13) 31)
	(= (distance city7 city14) 47)
	(= (distance city7 city15) 41)
	(= (distance city7 city16) 36)
	(= (distance city7 city17) 49)
	(= (distance city7 city18) 34)
	(= (distance city7 city19) 33)
	(= (distance city7 city20) 38)
	(= (distance city7 city21) 47)
	(= (distance city7 city22) 40)
	(= (distance city7 city23) 25)
	(= (distance city7 city24) 30)
	(= (distance city8 city0) 49)
	(= (distance city8 city1) 40)
	(= (distance city8 city2) 48)
	(= (distance city8 city3) 45)
	(= (distance city8 city4) 46)
	(= (distance city8 city5) 43)
	(= (distance city8 city6) 32)
	(= (distance city8 city7) 29)
	(= (distance city8 city8) 0)
	(= (distance city8 city9) 42)
	(= (distance city8 city10) 25)
	(= (distance city8 city11) 28)
	(= (distance city8 city12) 31)
	(= (distance city8 city13) 30)
	(= (distance city8 city14) 36)
	(= (distance city8 city15) 37)
	(= (distance city8 city16) 41)
	(= (distance city8 city17) 38)
	(= (distance city8 city18) 42)
	(= (distance city8 city19) 46)
	(= (distance city8 city20) 30)
	(= (distance city8 city21) 30)
	(= (distance city8 city22) 34)
	(= (distance city8 city23) 35)
	(= (distance city8 city24) 45)
	(= (distance city9 city0) 36)
	(= (distance city9 city1) 47)
	(= (distance city9 city2) 28)
	(= (distance city9 city3) 42)
	(= (distance city9 city4) 34)
	(= (distance city9 city5) 40)
	(= (distance city9 city6) 36)
	(= (distance city9 city7) 40)
	(= (distance city9 city8) 42)
	(= (distance city9 city9) 0)
	(= (distance city9 city10) 31)
	(= (distance city9 city11) 41)
	(= (distance city9 city12) 26)
	(= (distance city9 city13) 37)
	(= (distance city9 city14) 39)
	(= (distance city9 city15) 43)
	(= (distance city9 city16) 49)
	(= (distance city9 city17) 38)
	(= (distance city9 city18) 28)
	(= (distance city9 city19) 32)
	(= (distance city9 city20) 26)
	(= (distance city9 city21) 25)
	(= (distance city9 city22) 47)
	(= (distance city9 city23) 26)
	(= (distance city9 city24) 30)
	(= (distance city10 city0) 40)
	(= (distance city10 city1) 45)
	(= (distance city10 city2) 25)
	(= (distance city10 city3) 39)
	(= (distance city10 city4) 32)
	(= (distance city10 city5) 31)
	(= (distance city10 city6) 32)
	(= (distance city10 city7) 47)
	(= (distance city10 city8) 25)
	(= (distance city10 city9) 31)
	(= (distance city10 city10) 0)
	(= (distance city10 city11) 40)
	(= (distance city10 city12) 27)
	(= (distance city10 city13) 34)
	(= (distance city10 city14) 46)
	(= (distance city10 city15) 32)
	(= (distance city10 city16) 45)
	(= (distance city10 city17) 33)
	(= (distance city10 city18) 48)
	(= (distance city10 city19) 34)
	(= (distance city10 city20) 26)
	(= (distance city10 city21) 44)
	(= (distance city10 city22) 40)
	(= (distance city10 city23) 31)
	(= (distance city10 city24) 28)
	(= (distance city11 city0) 48)
	(= (distance city11 city1) 30)
	(= (distance city11 city2) 39)
	(= (distance city11 city3) 43)
	(= (distance city11 city4) 41)
	(= (distance city11 city5) 33)
	(= (distance city11 city6) 26)
	(= (distance city11 city7) 31)
	(= (distance city11 city8) 28)
	(= (distance city11 city9) 41)
	(= (distance city11 city10) 40)
	(= (distance city11 city11) 0)
	(= (distance city11 city12) 25)
	(= (distance city11 city13) 27)
	(= (distance city11 city14) 35)
	(= (distance city11 city15) 41)
	(= (distance city11 city16) 29)
	(= (distance city11 city17) 47)
	(= (distance city11 city18) 31)
	(= (distance city11 city19) 47)
	(= (distance city11 city20) 46)
	(= (distance city11 city21) 44)
	(= (distance city11 city22) 26)
	(= (distance city11 city23) 28)
	(= (distance city11 city24) 46)
	(= (distance city12 city0) 34)
	(= (distance city12 city1) 49)
	(= (distance city12 city2) 35)
	(= (distance city12 city3) 29)
	(= (distance city12 city4) 37)
	(= (distance city12 city5) 36)
	(= (distance city12 city6) 25)
	(= (distance city12 city7) 31)
	(= (distance city12 city8) 31)
	(= (distance city12 city9) 26)
	(= (distance city12 city10) 27)
	(= (distance city12 city11) 25)
	(= (distance city12 city12) 0)
	(= (distance city12 city13) 27)
	(= (distance city12 city14) 26)
	(= (distance city12 city15) 48)
	(= (distance city12 city16) 33)
	(= (distance city12 city17) 41)
	(= (distance city12 city18) 25)
	(= (distance city12 city19) 42)
	(= (distance city12 city20) 38)
	(= (distance city12 city21) 32)
	(= (distance city12 city22) 38)
	(= (distance city12 city23) 47)
	(= (distance city12 city24) 31)
	(= (distance city13 city0) 44)
	(= (distance city13 city1) 32)
	(= (distance city13 city2) 43)
	(= (distance city13 city3) 28)
	(= (distance city13 city4) 45)
	(= (distance city13 city5) 28)
	(= (distance city13 city6) 48)
	(= (distance city13 city7) 31)
	(= (distance city13 city8) 30)
	(= (distance city13 city9) 37)
	(= (distance city13 city10) 34)
	(= (distance city13 city11) 27)
	(= (distance city13 city12) 27)
	(= (distance city13 city13) 0)
	(= (distance city13 city14) 47)
	(= (distance city13 city15) 49)
	(= (distance city13 city16) 26)
	(= (distance city13 city17) 37)
	(= (distance city13 city18) 30)
	(= (distance city13 city19) 30)
	(= (distance city13 city20) 38)
	(= (distance city13 city21) 33)
	(= (distance city13 city22) 40)
	(= (distance city13 city23) 30)
	(= (distance city13 city24) 37)
	(= (distance city14 city0) 43)
	(= (distance city14 city1) 25)
	(= (distance city14 city2) 41)
	(= (distance city14 city3) 34)
	(= (distance city14 city4) 35)
	(= (distance city14 city5) 34)
	(= (distance city14 city6) 39)
	(= (distance city14 city7) 47)
	(= (distance city14 city8) 36)
	(= (distance city14 city9) 39)
	(= (distance city14 city10) 46)
	(= (distance city14 city11) 35)
	(= (distance city14 city12) 26)
	(= (distance city14 city13) 47)
	(= (distance city14 city14) 0)
	(= (distance city14 city15) 37)
	(= (distance city14 city16) 36)
	(= (distance city14 city17) 35)
	(= (distance city14 city18) 34)
	(= (distance city14 city19) 31)
	(= (distance city14 city20) 36)
	(= (distance city14 city21) 38)
	(= (distance city14 city22) 27)
	(= (distance city14 city23) 38)
	(= (distance city14 city24) 40)
	(= (distance city15 city0) 26)
	(= (distance city15 city1) 48)
	(= (distance city15 city2) 49)
	(= (distance city15 city3) 33)
	(= (distance city15 city4) 47)
	(= (distance city15 city5) 26)
	(= (distance city15 city6) 29)
	(= (distance city15 city7) 41)
	(= (distance city15 city8) 37)
	(= (distance city15 city9) 43)
	(= (distance city15 city10) 32)
	(= (distance city15 city11) 41)
	(= (distance city15 city12) 48)
	(= (distance city15 city13) 49)
	(= (distance city15 city14) 37)
	(= (distance city15 city15) 0)
	(= (distance city15 city16) 25)
	(= (distance city15 city17) 47)
	(= (distance city15 city18) 32)
	(= (distance city15 city19) 26)
	(= (distance city15 city20) 39)
	(= (distance city15 city21) 45)
	(= (distance city15 city22) 33)
	(= (distance city15 city23) 27)
	(= (distance city15 city24) 43)
	(= (distance city16 city0) 27)
	(= (distance city16 city1) 32)
	(= (distance city16 city2) 49)
	(= (distance city16 city3) 36)
	(= (distance city16 city4) 44)
	(= (distance city16 city5) 40)
	(= (distance city16 city6) 32)
	(= (distance city16 city7) 36)
	(= (distance city16 city8) 41)
	(= (distance city16 city9) 49)
	(= (distance city16 city10) 45)
	(= (distance city16 city11) 29)
	(= (distance city16 city12) 33)
	(= (distance city16 city13) 26)
	(= (distance city16 city14) 36)
	(= (distance city16 city15) 25)
	(= (distance city16 city16) 0)
	(= (distance city16 city17) 40)
	(= (distance city16 city18) 49)
	(= (distance city16 city19) 42)
	(= (distance city16 city20) 41)
	(= (distance city16 city21) 37)
	(= (distance city16 city22) 48)
	(= (distance city16 city23) 46)
	(= (distance city16 city24) 25)
	(= (distance city17 city0) 39)
	(= (distance city17 city1) 36)
	(= (distance city17 city2) 31)
	(= (distance city17 city3) 46)
	(= (distance city17 city4) 44)
	(= (distance city17 city5) 34)
	(= (distance city17 city6) 30)
	(= (distance city17 city7) 49)
	(= (distance city17 city8) 38)
	(= (distance city17 city9) 38)
	(= (distance city17 city10) 33)
	(= (distance city17 city11) 47)
	(= (distance city17 city12) 41)
	(= (distance city17 city13) 37)
	(= (distance city17 city14) 35)
	(= (distance city17 city15) 47)
	(= (distance city17 city16) 40)
	(= (distance city17 city17) 0)
	(= (distance city17 city18) 31)
	(= (distance city17 city19) 36)
	(= (distance city17 city20) 31)
	(= (distance city17 city21) 43)
	(= (distance city17 city22) 49)
	(= (distance city17 city23) 42)
	(= (distance city17 city24) 29)
	(= (distance city18 city0) 43)
	(= (distance city18 city1) 39)
	(= (distance city18 city2) 46)
	(= (distance city18 city3) 31)
	(= (distance city18 city4) 38)
	(= (distance city18 city5) 41)
	(= (distance city18 city6) 36)
	(= (distance city18 city7) 34)
	(= (distance city18 city8) 42)
	(= (distance city18 city9) 28)
	(= (distance city18 city10) 48)
	(= (distance city18 city11) 31)
	(= (distance city18 city12) 25)
	(= (distance city18 city13) 30)
	(= (distance city18 city14) 34)
	(= (distance city18 city15) 32)
	(= (distance city18 city16) 49)
	(= (distance city18 city17) 31)
	(= (distance city18 city18) 0)
	(= (distance city18 city19) 33)
	(= (distance city18 city20) 49)
	(= (distance city18 city21) 41)
	(= (distance city18 city22) 47)
	(= (distance city18 city23) 26)
	(= (distance city18 city24) 30)
	(= (distance city19 city0) 42)
	(= (distance city19 city1) 30)
	(= (distance city19 city2) 45)
	(= (distance city19 city3) 39)
	(= (distance city19 city4) 40)
	(= (distance city19 city5) 35)
	(= (distance city19 city6) 27)
	(= (distance city19 city7) 33)
	(= (distance city19 city8) 46)
	(= (distance city19 city9) 32)
	(= (distance city19 city10) 34)
	(= (distance city19 city11) 47)
	(= (distance city19 city12) 42)
	(= (distance city19 city13) 30)
	(= (distance city19 city14) 31)
	(= (distance city19 city15) 26)
	(= (distance city19 city16) 42)
	(= (distance city19 city17) 36)
	(= (distance city19 city18) 33)
	(= (distance city19 city19) 0)
	(= (distance city19 city20) 37)
	(= (distance city19 city21) 27)
	(= (distance city19 city22) 27)
	(= (distance city19 city23) 44)
	(= (distance city19 city24) 28)
	(= (distance city20 city0) 45)
	(= (distance city20 city1) 46)
	(= (distance city20 city2) 37)
	(= (distance city20 city3) 46)
	(= (distance city20 city4) 37)
	(= (distance city20 city5) 30)
	(= (distance city20 city6) 30)
	(= (distance city20 city7) 38)
	(= (distance city20 city8) 30)
	(= (distance city20 city9) 26)
	(= (distance city20 city10) 26)
	(= (distance city20 city11) 46)
	(= (distance city20 city12) 38)
	(= (distance city20 city13) 38)
	(= (distance city20 city14) 36)
	(= (distance city20 city15) 39)
	(= (distance city20 city16) 41)
	(= (distance city20 city17) 31)
	(= (distance city20 city18) 49)
	(= (distance city20 city19) 37)
	(= (distance city20 city20) 0)
	(= (distance city20 city21) 41)
	(= (distance city20 city22) 39)
	(= (distance city20 city23) 37)
	(= (distance city20 city24) 43)
	(= (distance city21 city0) 45)
	(= (distance city21 city1) 33)
	(= (distance city21 city2) 45)
	(= (distance city21 city3) 46)
	(= (distance city21 city4) 28)
	(= (distance city21 city5) 26)
	(= (distance city21 city6) 29)
	(= (distance city21 city7) 47)
	(= (distance city21 city8) 30)
	(= (distance city21 city9) 25)
	(= (distance city21 city10) 44)
	(= (distance city21 city11) 44)
	(= (distance city21 city12) 32)
	(= (distance city21 city13) 33)
	(= (distance city21 city14) 38)
	(= (distance city21 city15) 45)
	(= (distance city21 city16) 37)
	(= (distance city21 city17) 43)
	(= (distance city21 city18) 41)
	(= (distance city21 city19) 27)
	(= (distance city21 city20) 41)
	(= (distance city21 city21) 0)
	(= (distance city21 city22) 32)
	(= (distance city21 city23) 27)
	(= (distance city21 city24) 43)
	(= (distance city22 city0) 44)
	(= (distance city22 city1) 48)
	(= (distance city22 city2) 27)
	(= (distance city22 city3) 25)
	(= (distance city22 city4) 34)
	(= (distance city22 city5) 42)
	(= (distance city22 city6) 42)
	(= (distance city22 city7) 40)
	(= (distance city22 city8) 34)
	(= (distance city22 city9) 47)
	(= (distance city22 city10) 40)
	(= (distance city22 city11) 26)
	(= (distance city22 city12) 38)
	(= (distance city22 city13) 40)
	(= (distance city22 city14) 27)
	(= (distance city22 city15) 33)
	(= (distance city22 city16) 48)
	(= (distance city22 city17) 49)
	(= (distance city22 city18) 47)
	(= (distance city22 city19) 27)
	(= (distance city22 city20) 39)
	(= (distance city22 city21) 32)
	(= (distance city22 city22) 0)
	(= (distance city22 city23) 25)
	(= (distance city22 city24) 44)
	(= (distance city23 city0) 44)
	(= (distance city23 city1) 47)
	(= (distance city23 city2) 37)
	(= (distance city23 city3) 39)
	(= (distance city23 city4) 41)
	(= (distance city23 city5) 46)
	(= (distance city23 city6) 37)
	(= (distance city23 city7) 25)
	(= (distance city23 city8) 35)
	(= (distance city23 city9) 26)
	(= (distance city23 city10) 31)
	(= (distance city23 city11) 28)
	(= (distance city23 city12) 47)
	(= (distance city23 city13) 30)
	(= (distance city23 city14) 38)
	(= (distance city23 city15) 27)
	(= (distance city23 city16) 46)
	(= (distance city23 city17) 42)
	(= (distance city23 city18) 26)
	(= (distance city23 city19) 44)
	(= (distance city23 city20) 37)
	(= (distance city23 city21) 27)
	(= (distance city23 city22) 25)
	(= (distance city23 city23) 0)
	(= (distance city23 city24) 31)
	(= (distance city24 city0) 39)
	(= (distance city24 city1) 36)
	(= (distance city24 city2) 44)
	(= (distance city24 city3) 37)
	(= (distance city24 city4) 31)
	(= (distance city24 city5) 38)
	(= (distance city24 city6) 38)
	(= (distance city24 city7) 30)
	(= (distance city24 city8) 45)
	(= (distance city24 city9) 30)
	(= (distance city24 city10) 28)
	(= (distance city24 city11) 46)
	(= (distance city24 city12) 31)
	(= (distance city24 city13) 37)
	(= (distance city24 city14) 40)
	(= (distance city24 city15) 43)
	(= (distance city24 city16) 25)
	(= (distance city24 city17) 29)
	(= (distance city24 city18) 30)
	(= (distance city24 city19) 28)
	(= (distance city24 city20) 43)
	(= (distance city24 city21) 43)
	(= (distance city24 city22) 44)
	(= (distance city24 city23) 31)
	(= (distance city24 city24) 0)
	(= (total-fuel-used) 0)
)
(:goal (and
	(located plane2 city18)
	(located person1 city10)
	(located person2 city22)
	(located person3 city7)
	(located person4 city22)
	(located person5 city11)
	(located person7 city13)
	(located person8 city22)
	(located person9 city8)
	(located person10 city11)
	(located person11 city1)
	(located person12 city21)
	(located person14 city2)
	(located person15 city10)
	(located person16 city8)
	(located person17 city0)
	(located person18 city19)
	(located person19 city0)
	(located person20 city7)
	(located person21 city15)
	(located person22 city3)
	(located person23 city16)
	(located person24 city19)
	(located person25 city2)
	(located person26 city6)
	(located person27 city11)
	(located person28 city2)
	(located person29 city9)
	(located person30 city2)
	))




(:constraints (and (always-within 10 (> (onboard plane1) 0) (= (onboard plane1) 0))
(always-within 10 (> (onboard plane2) 0) (= (onboard plane2) 0))
(always-within 10 (> (onboard plane3) 0) (= (onboard plane3) 0))
(always-within 10 (> (onboard plane4) 0) (= (onboard plane4) 0))
(always-within 10 (> (onboard plane5) 0) (= (onboard plane5) 0))
(always-within 6 (<= (fuel plane1) (* 0.5 (capacity plane1))) (= (fuel plane1) (capacity plane1)))
(always-within 6 (<= (fuel plane2) (* 0.5 (capacity plane2))) (= (fuel plane2) (capacity plane2)))
(always-within 6 (<= (fuel plane3) (* 0.5 (capacity plane3))) (= (fuel plane3) (capacity plane3)))
(always-within 6 (<= (fuel plane4) (* 0.5 (capacity plane4))) (= (fuel plane4) (capacity plane4)))
(always-within 6 (<= (fuel plane5) (* 0.5 (capacity plane5))) (= (fuel plane5) (capacity plane5)))))

)