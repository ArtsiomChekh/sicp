#lang racket

(require rackunit
         rackunit/text-ui
         "../main/ex_1.21.rkt")

(run-tests
 (test-suite
  "ex_1.21.rkt"
  (check-equal? (divides? 2 4) #t)
  (check-equal? (divides? 3 6) #t)
  (check-equal? (divides? 199 199) #t)
  (check-equal? (divides? 3 1999) #f)

  (check-equal? (find-divisor 4 1) 1)
  (check-equal? (find-divisor 4 2) 2)
  (check-equal? (find-divisor 4 3) 4)
  (check-equal? (find-divisor 24 4) 4)

  (check-equal? (smallest-divisor 4) 2)
  (check-equal? (smallest-divisor 9) 3)
  (check-equal? (smallest-divisor 13) 13)
  ))