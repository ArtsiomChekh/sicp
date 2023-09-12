#lang racket

(require rackunit
         rackunit/text-ui
         "../main/ex_1.16.rkt")

(run-tests
 (test-suite
  "ex_1.16.rkt"
  (check-equal? (square 2) 4)
  (check-equal? (square 4) 16)

  (check-equal? (fast-expt 2 2) 4)
  (check-equal? (fast-expt 4 3) 64)
  (check-equal? (fast-expt 10 10) 10000000000)
  ))