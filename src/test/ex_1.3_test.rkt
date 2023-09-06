#lang racket

(require rackunit
         rackunit/text-ui
         "../main/ex_1.3.rkt")

(run-tests
 (test-suite
  "ex_1.3"
  (check-equal? (square 2) 4)
  (check-equal? (square 4) 16)
  (check-not-equal? (square 4) 15)

  (check-equal? (sum-of-squares 2 4) 20)
  (check-equal? (sum-of-squares 5 5) 50)

  (check-equal? (sum-of-squares-of-largest 2 4 5) 41)
  (check-equal? (sum-of-squares-of-largest 6 1 8) 100)
  ))