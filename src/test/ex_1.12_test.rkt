#lang racket

(require rackunit
         rackunit/text-ui
         "../main/ex_1.12.rkt")

(run-tests
 (test-suite
  "ex_1.12"
  (check-equal? (pascal 0 2) 1)
  (check-equal? (pascal 1 2) 2)
  (check-equal? (pascal 1 3) 3)
  (check-equal? (pascal 2 4) 6)
  ))
