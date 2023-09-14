#lang racket

(require rackunit
         rackunit/text-ui
         "../main/ex_1.19.rkt")

(run-tests
 (test-suite
  "ex_1.19.rkt"
  (check-equal? (fib 0) 0)
  (check-equal? (fib 1) 1)
  (check-equal? (fib 2) 1)
  (check-equal? (fib 6) 8)
  (check-equal? (fib 10) 55)
  ))