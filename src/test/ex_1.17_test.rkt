#lang racket

(require rackunit
         rackunit/text-ui
         "../main/ex_1.17.rkt")

(run-tests
 (test-suite
  "ex_1.17.rkt"
  (check-equal? (double 2) 4)
  (check-equal? (double 10) 20)

  (check-equal? (halve 2) 1)
  (check-equal? (halve 10) 5)

  (check-equal? (even? 10) #t)
  (check-equal? (even? 11) #f)

  (check-equal? (multiply 2 3) 6)
  (check-equal? (multiply 10 3) 30)
  (check-equal? (multiply 1000 839) 839000)
  ))
         
