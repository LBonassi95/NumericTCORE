 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Block grouping domain
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; A number of blocks of different colours lie on a grid-like environment.
;;; The objective is to group the blocks by colour, i.e. to have all blocks
;;; of the same color in the same cell, which is at the same time
;;; different to the cell where blocks of other colors are:
;;;
;;; forall i, j color(i) = color(j) <=> loc(i) = loc(j)
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (domain mt-block-grouping)
    ;(:requirements :typing )
    (:types block - object )
    (:functions
        (x ?b - block)  ;; The position of a block
        (y ?b - block)  ;;
        (max_x)
        (min_x)
        (max_y)
        (min_y)
    )

    ;; Move a block from its location to an adjacent location
    (:action moveblockup
     :parameters (?b - block)
     :precondition (and (<= (+ (y ?b)1) (max_y) ))
     :effect (and
        (increase (y ?b) 1)
    ))

    (:action moveblockdown
     :parameters (?b - block)
     :precondition (and (>= (- (y ?b) 1) (min_y) ))
     :effect (and
        (decrease (y ?b) 1)
    ))

    (:action moveblockright
     :parameters (?b - block)
     :precondition (and (<= (+ (x ?b)1) (max_x) ))
     :effect (and
        (increase (x ?b) 1)
    ))

    (:action moveblockleft
     :parameters (?b - block)
     :precondition (and (>= (- (x ?b) 1) (min_x) ))
     :effect (and
        (decrease (x ?b) 1)
    ))

)
