#lang racket

(require rackunit
         "../main/ex_1.8.rkt")

(define (report-success description)
  (printf "Test passed: ~a\n" description))

(check-equal? (square 2) 4 "Square")
(report-success "Square of 2 is 4")

(check-equal? (square 4) 16 "Square")
(report-success "Square of 4 is 16")

(check-equal? (average 2 4) 3 "Average")
(report-success "Average of 2 and 4 is 3")

(check-equal? (average 5 5) 5 "Average")
(report-success "Average of 5 and 5 is 5")

(check-equal? (cube 4) 64 "Cube")
(report-success "Cube of 4 is 64")

(check-equal? (cube 10) 1000 "Cube")
(report-success "Cube of 10 is 1000")
