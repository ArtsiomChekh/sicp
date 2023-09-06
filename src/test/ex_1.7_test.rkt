#lang racket

(require rackunit
         rackunit/text-ui
         "../main/ex_1.7.rkt")

(run-tests
 (test-suite
  "ex_1.7"
  (check-equal? (square 2) 4) 
  (check-equal? (square 4) 16)

  (check-equal? (average 2 4) 3)
  (check-equal? (average 5 5) 5)
 
  (check-equal? (new-sqrt 100) 10.0)
  (check-equal? (new-sqrt 1000000000000) 1000000.0)
  (check-within (new-sqrt 0.000001) 0.001 0.000001)
  ))