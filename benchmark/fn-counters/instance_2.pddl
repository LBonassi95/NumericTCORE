
(define (problem instance_2)
  (:domain fn-counters)
  (:objects
    c0 c1 - counter
  )

  (:init
    (= (value c0) 0)
	(= (value c1) 0)
	(= (max_int) 4)
  )

  (:goal (and 
(<= (+ (value c0) 1) (value c1))
  ))

  
  

  


(:constraints (and (sometime-before (> (value c1) 0) (= (value c0) (max_int)))))

)