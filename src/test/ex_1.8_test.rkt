#lang racket

(require rackunit
         rackunit/text-ui
         "../main/ex_1.8.rkt")

(run-tests
 (test-suite
  "ex_1.8"
  (check-equal? (square 2) 4)
  (check-equal? (square 4) 16)

  (check-equal? (average 2 4) 3)
  (check-equal? (average 5 5) 5)

  (check-equal? (cube 4) 64)
  (check-equal? (cube 10) 1000)
  ))

