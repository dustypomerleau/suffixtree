#lang setup/infotab
(define name "suffixtree")
(define version "1.2")
(define collection "suffixtree")
(define deps
  '("base"
    "plot-gui-lib"
    "plot-lib"
    "profile-lib"
    "rackunit-lib"
    "srfi-lite-lib"))
(define build-deps '("racket-doc"
                     "sandbox-lib"
                     "scribble-lib"))
(define scribblings '(("suffixtree.scrbl" ())))

