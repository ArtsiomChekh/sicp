#lang racket

(require rackunit
         rackunit/text-ui
         "../main/ex_1.20.rkt")

(run-tests
 (test-suite
  "ex_1.20.rkt"
  (check-equal? (gcd 2 2) 2)
  (check-equal? (gcd 16 28) 4)
  (check-equal? (gcd 206 40) 2)
  ))