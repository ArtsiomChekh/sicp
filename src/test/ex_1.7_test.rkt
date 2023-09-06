#lang racket

(require rackunit
         "../main/ex_1.7.rkt")

(define counter 0)

(define (report-success description)
  (set! counter (+ counter 1))
  (printf "Test ~a passed: ~a\n" counter description))

(check-equal? (square 2) 4 "Square")
(report-success "Square of 2 is 4")

(check-equal? (square 4) 16 "Square")
(report-success "Square of 4 is 16")

(check-equal? (average 2 4) 3 "Average")
(report-success "Average of 2 and 4 is 3")

(check-equal? (average 5 5) 5 "Average")
(report-success "Average of 5 and 5 is 5")

(check-equal? (new-sqrt 100) 10.0 "New-sqrt")
(report-success "New-sqrt of 100 is 10")
