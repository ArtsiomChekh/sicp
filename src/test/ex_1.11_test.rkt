#lang racket

(require rackunit
         rackunit/text-ui
         "../main/ex_1.11.rkt")

(run-tests
 (test-suite
  "ex_1.11"
  (check-equal? (rec-func 2) 2) 
  (check-equal? (rec-func 3) 3) 
  (check-equal? (rec-func 5) 11)

  (check-equal? (iter-func 2) 2) 
  (check-equal? (iter-func 3) 3) 
  (check-equal? (iter-func 5) 11)

  (check-equal? (iter-func 5) (rec-func 5)) 
  ))