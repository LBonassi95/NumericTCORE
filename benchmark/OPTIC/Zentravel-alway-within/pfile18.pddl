(define (problem ZTRAVEL-5-20)
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
	)
(:init
	(located plane1 city11)
	(= (capacity plane1) 4584)
	(= (fuel plane1) 52)
	(= (slow-burn plane1) 2)
	(= (fast-burn plane1) 6)
	(= (onboard plane1) 0)
	(= (zoom-limit plane1) 6)
	(located plane2 city12)
	(= (capacity plane2) 2146)
	(= (fuel plane2) 465)
	(= (slow-burn plane2) 1)
	(= (fast-burn plane2) 3)
	(= (onboard plane2) 0)
	(= (zoom-limit plane2) 8)
	(located plane3 city12)
	(= (capacity plane3) 10291)
	(= (fuel plane3) 3346)
	(= (slow-burn plane3) 4)
	(= (fast-burn plane3) 15)
	(= (onboard plane3) 0)
	(= (zoom-limit plane3) 5)
	(located plane4 city14)
	(= (capacity plane4) 6022)
	(= (fuel plane4) 1470)
	(= (slow-burn plane4) 2)
	(= (fast-burn plane4) 4)
	(= (onboard plane4) 0)
	(= (zoom-limit plane4) 4)
	(located plane5 city14)
	(= (capacity plane5) 2861)
	(= (fuel plane5) 300)
	(= (slow-burn plane5) 1)
	(= (fast-burn plane5) 2)
	(= (onboard plane5) 0)
	(= (zoom-limit plane5) 5)
	(located person1 city7)
	(located person2 city16)
	(located person3 city9)
	(located person4 city6)
	(located person5 city6)
	(located person6 city0)
	(located person7 city6)
	(located person8 city8)
	(located person9 city13)
	(located person10 city14)
	(located person11 city7)
	(located person12 city15)
	(located person13 city4)
	(located person14 city14)
	(located person15 city10)
	(located person16 city5)
	(located person17 city10)
	(located person18 city11)
	(located person19 city9)
	(located person20 city3)
	(= (distance city0 city0) 0)
	(= (distance city0 city1) 674)
	(= (distance city0 city2) 632)
	(= (distance city0 city3) 961)
	(= (distance city0 city4) 887)
	(= (distance city0 city5) 592)
	(= (distance city0 city6) 555)
	(= (distance city0 city7) 588)
	(= (distance city0 city8) 923)
	(= (distance city0 city9) 774)
	(= (distance city0 city10) 707)
	(= (distance city0 city11) 858)
	(= (distance city0 city12) 776)
	(= (distance city0 city13) 837)
	(= (distance city0 city14) 823)
	(= (distance city0 city15) 895)
	(= (distance city0 city16) 683)
	(= (distance city0 city17) 588)
	(= (distance city1 city0) 674)
	(= (distance city1 city1) 0)
	(= (distance city1 city2) 600)
	(= (distance city1 city3) 546)
	(= (distance city1 city4) 748)
	(= (distance city1 city5) 777)
	(= (distance city1 city6) 669)
	(= (distance city1 city7) 758)
	(= (distance city1 city8) 925)
	(= (distance city1 city9) 509)
	(= (distance city1 city10) 754)
	(= (distance city1 city11) 779)
	(= (distance city1 city12) 525)
	(= (distance city1 city13) 964)
	(= (distance city1 city14) 831)
	(= (distance city1 city15) 836)
	(= (distance city1 city16) 639)
	(= (distance city1 city17) 964)
	(= (distance city2 city0) 632)
	(= (distance city2 city1) 600)
	(= (distance city2 city2) 0)
	(= (distance city2 city3) 797)
	(= (distance city2 city4) 526)
	(= (distance city2 city5) 557)
	(= (distance city2 city6) 853)
	(= (distance city2 city7) 614)
	(= (distance city2 city8) 980)
	(= (distance city2 city9) 627)
	(= (distance city2 city10) 822)
	(= (distance city2 city11) 838)
	(= (distance city2 city12) 904)
	(= (distance city2 city13) 659)
	(= (distance city2 city14) 662)
	(= (distance city2 city15) 800)
	(= (distance city2 city16) 843)
	(= (distance city2 city17) 750)
	(= (distance city3 city0) 961)
	(= (distance city3 city1) 546)
	(= (distance city3 city2) 797)
	(= (distance city3 city3) 0)
	(= (distance city3 city4) 900)
	(= (distance city3 city5) 890)
	(= (distance city3 city6) 998)
	(= (distance city3 city7) 677)
	(= (distance city3 city8) 559)
	(= (distance city3 city9) 756)
	(= (distance city3 city10) 603)
	(= (distance city3 city11) 569)
	(= (distance city3 city12) 511)
	(= (distance city3 city13) 882)
	(= (distance city3 city14) 594)
	(= (distance city3 city15) 976)
	(= (distance city3 city16) 714)
	(= (distance city3 city17) 931)
	(= (distance city4 city0) 887)
	(= (distance city4 city1) 748)
	(= (distance city4 city2) 526)
	(= (distance city4 city3) 900)
	(= (distance city4 city4) 0)
	(= (distance city4 city5) 615)
	(= (distance city4 city6) 678)
	(= (distance city4 city7) 728)
	(= (distance city4 city8) 641)
	(= (distance city4 city9) 735)
	(= (distance city4 city10) 582)
	(= (distance city4 city11) 756)
	(= (distance city4 city12) 716)
	(= (distance city4 city13) 710)
	(= (distance city4 city14) 578)
	(= (distance city4 city15) 555)
	(= (distance city4 city16) 614)
	(= (distance city4 city17) 738)
	(= (distance city5 city0) 592)
	(= (distance city5 city1) 777)
	(= (distance city5 city2) 557)
	(= (distance city5 city3) 890)
	(= (distance city5 city4) 615)
	(= (distance city5 city5) 0)
	(= (distance city5 city6) 717)
	(= (distance city5 city7) 915)
	(= (distance city5 city8) 581)
	(= (distance city5 city9) 967)
	(= (distance city5 city10) 816)
	(= (distance city5 city11) 972)
	(= (distance city5 city12) 966)
	(= (distance city5 city13) 993)
	(= (distance city5 city14) 531)
	(= (distance city5 city15) 722)
	(= (distance city5 city16) 597)
	(= (distance city5 city17) 600)
	(= (distance city6 city0) 555)
	(= (distance city6 city1) 669)
	(= (distance city6 city2) 853)
	(= (distance city6 city3) 998)
	(= (distance city6 city4) 678)
	(= (distance city6 city5) 717)
	(= (distance city6 city6) 0)
	(= (distance city6 city7) 734)
	(= (distance city6 city8) 979)
	(= (distance city6 city9) 694)
	(= (distance city6 city10) 711)
	(= (distance city6 city11) 693)
	(= (distance city6 city12) 626)
	(= (distance city6 city13) 826)
	(= (distance city6 city14) 872)
	(= (distance city6 city15) 855)
	(= (distance city6 city16) 968)
	(= (distance city6 city17) 607)
	(= (distance city7 city0) 588)
	(= (distance city7 city1) 758)
	(= (distance city7 city2) 614)
	(= (distance city7 city3) 677)
	(= (distance city7 city4) 728)
	(= (distance city7 city5) 915)
	(= (distance city7 city6) 734)
	(= (distance city7 city7) 0)
	(= (distance city7 city8) 937)
	(= (distance city7 city9) 724)
	(= (distance city7 city10) 824)
	(= (distance city7 city11) 647)
	(= (distance city7 city12) 803)
	(= (distance city7 city13) 879)
	(= (distance city7 city14) 762)
	(= (distance city7 city15) 541)
	(= (distance city7 city16) 596)
	(= (distance city7 city17) 677)
	(= (distance city8 city0) 923)
	(= (distance city8 city1) 925)
	(= (distance city8 city2) 980)
	(= (distance city8 city3) 559)
	(= (distance city8 city4) 641)
	(= (distance city8 city5) 581)
	(= (distance city8 city6) 979)
	(= (distance city8 city7) 937)
	(= (distance city8 city8) 0)
	(= (distance city8 city9) 623)
	(= (distance city8 city10) 564)
	(= (distance city8 city11) 993)
	(= (distance city8 city12) 595)
	(= (distance city8 city13) 530)
	(= (distance city8 city14) 987)
	(= (distance city8 city15) 627)
	(= (distance city8 city16) 753)
	(= (distance city8 city17) 584)
	(= (distance city9 city0) 774)
	(= (distance city9 city1) 509)
	(= (distance city9 city2) 627)
	(= (distance city9 city3) 756)
	(= (distance city9 city4) 735)
	(= (distance city9 city5) 967)
	(= (distance city9 city6) 694)
	(= (distance city9 city7) 724)
	(= (distance city9 city8) 623)
	(= (distance city9 city9) 0)
	(= (distance city9 city10) 727)
	(= (distance city9 city11) 988)
	(= (distance city9 city12) 564)
	(= (distance city9 city13) 922)
	(= (distance city9 city14) 699)
	(= (distance city9 city15) 758)
	(= (distance city9 city16) 548)
	(= (distance city9 city17) 525)
	(= (distance city10 city0) 707)
	(= (distance city10 city1) 754)
	(= (distance city10 city2) 822)
	(= (distance city10 city3) 603)
	(= (distance city10 city4) 582)
	(= (distance city10 city5) 816)
	(= (distance city10 city6) 711)
	(= (distance city10 city7) 824)
	(= (distance city10 city8) 564)
	(= (distance city10 city9) 727)
	(= (distance city10 city10) 0)
	(= (distance city10 city11) 630)
	(= (distance city10 city12) 903)
	(= (distance city10 city13) 994)
	(= (distance city10 city14) 738)
	(= (distance city10 city15) 841)
	(= (distance city10 city16) 718)
	(= (distance city10 city17) 562)
	(= (distance city11 city0) 858)
	(= (distance city11 city1) 779)
	(= (distance city11 city2) 838)
	(= (distance city11 city3) 569)
	(= (distance city11 city4) 756)
	(= (distance city11 city5) 972)
	(= (distance city11 city6) 693)
	(= (distance city11 city7) 647)
	(= (distance city11 city8) 993)
	(= (distance city11 city9) 988)
	(= (distance city11 city10) 630)
	(= (distance city11 city11) 0)
	(= (distance city11 city12) 988)
	(= (distance city11 city13) 521)
	(= (distance city11 city14) 942)
	(= (distance city11 city15) 751)
	(= (distance city11 city16) 563)
	(= (distance city11 city17) 539)
	(= (distance city12 city0) 776)
	(= (distance city12 city1) 525)
	(= (distance city12 city2) 904)
	(= (distance city12 city3) 511)
	(= (distance city12 city4) 716)
	(= (distance city12 city5) 966)
	(= (distance city12 city6) 626)
	(= (distance city12 city7) 803)
	(= (distance city12 city8) 595)
	(= (distance city12 city9) 564)
	(= (distance city12 city10) 903)
	(= (distance city12 city11) 988)
	(= (distance city12 city12) 0)
	(= (distance city12 city13) 929)
	(= (distance city12 city14) 687)
	(= (distance city12 city15) 604)
	(= (distance city12 city16) 922)
	(= (distance city12 city17) 782)
	(= (distance city13 city0) 837)
	(= (distance city13 city1) 964)
	(= (distance city13 city2) 659)
	(= (distance city13 city3) 882)
	(= (distance city13 city4) 710)
	(= (distance city13 city5) 993)
	(= (distance city13 city6) 826)
	(= (distance city13 city7) 879)
	(= (distance city13 city8) 530)
	(= (distance city13 city9) 922)
	(= (distance city13 city10) 994)
	(= (distance city13 city11) 521)
	(= (distance city13 city12) 929)
	(= (distance city13 city13) 0)
	(= (distance city13 city14) 634)
	(= (distance city13 city15) 910)
	(= (distance city13 city16) 910)
	(= (distance city13 city17) 888)
	(= (distance city14 city0) 823)
	(= (distance city14 city1) 831)
	(= (distance city14 city2) 662)
	(= (distance city14 city3) 594)
	(= (distance city14 city4) 578)
	(= (distance city14 city5) 531)
	(= (distance city14 city6) 872)
	(= (distance city14 city7) 762)
	(= (distance city14 city8) 987)
	(= (distance city14 city9) 699)
	(= (distance city14 city10) 738)
	(= (distance city14 city11) 942)
	(= (distance city14 city12) 687)
	(= (distance city14 city13) 634)
	(= (distance city14 city14) 0)
	(= (distance city14 city15) 995)
	(= (distance city14 city16) 637)
	(= (distance city14 city17) 876)
	(= (distance city15 city0) 895)
	(= (distance city15 city1) 836)
	(= (distance city15 city2) 800)
	(= (distance city15 city3) 976)
	(= (distance city15 city4) 555)
	(= (distance city15 city5) 722)
	(= (distance city15 city6) 855)
	(= (distance city15 city7) 541)
	(= (distance city15 city8) 627)
	(= (distance city15 city9) 758)
	(= (distance city15 city10) 841)
	(= (distance city15 city11) 751)
	(= (distance city15 city12) 604)
	(= (distance city15 city13) 910)
	(= (distance city15 city14) 995)
	(= (distance city15 city15) 0)
	(= (distance city15 city16) 560)
	(= (distance city15 city17) 560)
	(= (distance city16 city0) 683)
	(= (distance city16 city1) 639)
	(= (distance city16 city2) 843)
	(= (distance city16 city3) 714)
	(= (distance city16 city4) 614)
	(= (distance city16 city5) 597)
	(= (distance city16 city6) 968)
	(= (distance city16 city7) 596)
	(= (distance city16 city8) 753)
	(= (distance city16 city9) 548)
	(= (distance city16 city10) 718)
	(= (distance city16 city11) 563)
	(= (distance city16 city12) 922)
	(= (distance city16 city13) 910)
	(= (distance city16 city14) 637)
	(= (distance city16 city15) 560)
	(= (distance city16 city16) 0)
	(= (distance city16 city17) 576)
	(= (distance city17 city0) 588)
	(= (distance city17 city1) 964)
	(= (distance city17 city2) 750)
	(= (distance city17 city3) 931)
	(= (distance city17 city4) 738)
	(= (distance city17 city5) 600)
	(= (distance city17 city6) 607)
	(= (distance city17 city7) 677)
	(= (distance city17 city8) 584)
	(= (distance city17 city9) 525)
	(= (distance city17 city10) 562)
	(= (distance city17 city11) 539)
	(= (distance city17 city12) 782)
	(= (distance city17 city13) 888)
	(= (distance city17 city14) 876)
	(= (distance city17 city15) 560)
	(= (distance city17 city16) 576)
	(= (distance city17 city17) 0)
	(= (total-fuel-used) 0)
)
(:goal (and
	(located plane2 city6)
	(located person1 city2)
	(located person2 city17)
	(located person3 city7)
	(located person4 city14)
	(located person5 city9)
	(located person6 city13)
	(located person7 city6)
	(located person8 city8)
	(located person9 city4)
	(located person10 city16)
	(located person11 city6)
	(located person12 city4)
	(located person13 city14)
	(located person14 city2)
	(located person15 city9)
	(located person16 city9)
	(located person17 city15)
	(located person18 city6)
	(located person19 city2)
	(located person20 city17)
	))




(:constraints (and (always-within 0.01 (> (onboard plane1) 0) (= (onboard plane1) 0))
(always-within 0.01 (> (onboard plane2) 0) (= (onboard plane2) 0))
(always-within 0.01 (> (onboard plane3) 0) (= (onboard plane3) 0))
(always-within 0.01 (> (onboard plane4) 0) (= (onboard plane4) 0))
(always-within 0.01 (> (onboard plane5) 0) (= (onboard plane5) 0))
(always-within 0.003 (<= (fuel plane1) (* 0.5 (capacity plane1))) (= (fuel plane1) (capacity plane1)))
(always-within 0.003 (<= (fuel plane2) (* 0.5 (capacity plane2))) (= (fuel plane2) (capacity plane2)))
(always-within 0.003 (<= (fuel plane3) (* 0.5 (capacity plane3))) (= (fuel plane3) (capacity plane3)))
(always-within 0.003 (<= (fuel plane4) (* 0.5 (capacity plane4))) (= (fuel plane4) (capacity plane4)))
(always-within 0.003 (<= (fuel plane5) (* 0.5 (capacity plane5))) (= (fuel plane5) (capacity plane5)))))

)