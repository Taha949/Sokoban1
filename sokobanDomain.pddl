
(define (domain sokobanDomain)
  (:requirements :strips :typing)
  (:types case)
  (:predicates (over ?x ?y)
              (isRight ?x ?y)
              (NotBlock ?x)
              (Block ?x)
              (Guard ?x)
              (NotGuard ?x))

  (:action GoUP
	     :parameters (?x - case ?y - case)
	     :precondition (and (over ?y ?x) (Guard ?x)
	                        (NotGuard ?y) (NotBlock ?y))
	     :effect (and (not (Guard ?x)) (NotGuard ?x) (not (NotGuard ?y)) (Guard ?y)))

  (:action GoDown
	     :parameters (?x - case ?y - case)
	     :precondition (and (over ?x ?y) (Guard ?x)
	                   (NotGuard ?y) (NotBlock ?y))
	     :effect (and  (not (Guard ?x)) (NotGuard ?x) (not (NotGuard ?y)) (Guard ?y)))


  (:action GoLeft
	     :parameters (?x - case ?y - case)
	     :precondition (and (isRight ?x ?y) (Guard ?x)
	                   (NotGuard ?y) (NotBlock ?y))
	     :effect
	     (and
		   (not (Guard ?x))
		   (NotGuard ?x)

		   (not (NotGuard ?y))
		   (Guard ?y)))

  (:action GoRight
	     :parameters (?x - case ?y - case)
	     :precondition (and (isRight ?y ?x) (Guard ?x) (NotGuard ?y) (NotBlock ?y))
	     :effect
	     (and
		   (not (Guard ?x))
		   (NotGuard ?x)

		   (not (NotGuard ?y))
		   (Guard ?y)))

  (:action PushUp
	     :parameters (?a - case ?x - case ?y - case)
	     :precondition (and (Guard ?a) (over ?x ?a) (over ?y ?x) (Block ?x) (NotBlock ?y))
	     :effect
	     (and

	           (not (Guard ?a))
	           (NotGuard ?a)

	           (not (NotGuard ?x))
	           (Guard ?x)

	     	   (not (NotBlock ?y))
	     	   (Block ?y)

	     	   (NotBlock ?x)
	     	   (not (Block ?x))

		   ))

  (:action PushDown
	     :parameters (?a - case ?x - case ?y - case)
	     :precondition (and (Guard ?a) (over ?a ?x) (over ?x ?y) (NotBlock ?y) (Block ?x) )
	     :effect  (and  (not (Guard ?a)) (NotGuard ?a) (not (NotGuard ?x)) (Guard ?x)  (not (NotBlock ?y)) (Block ?y)  (NotBlock ?x) (not (Block ?x))))

  (:action PushLeft
	     :parameters (?a - case ?x - case ?y - case)
	     :precondition (and (Guard ?a) (isRight ?a ?x) (isRight ?x ?y) (Block ?x) (NotBlock ?y))
	     :effect (and (not (Guard ?a)) (NotGuard ?a) (not (NotGuard ?x)) (Guard ?x) (not (NotBlock ?y)) (Block ?y) (NotBlock ?x) (not (Block ?x))))

  (:action PushRight
	     :parameters (?a - case ?x - case ?y - case)
	     :precondition (and (Guard ?a) (isRight ?x ?a) (isRight ?y ?x) (Block ?x) (NotBlock ?y))
	     :effect (and (not (Guard ?a)) (NotGuard ?a) (not (NotGuard ?x)) (Guard ?x) (not (NotBlock ?y)) (Block ?y) (NotBlock ?x) (not (Block ?x))))


  )
