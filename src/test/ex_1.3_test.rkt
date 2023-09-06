#lang racket

(require rackunit
         "../main/ex_1.3.rkt")

(define (report-success description)
  (printf "Test passed: ~a\n" description))

(check-equal? (square 2) 4 "Square")
(report-success "Square of 2 is 4")

(check-equal? (square 4) 16 "Square")
(report-success "Square of 4 is 16")

(check-not-equal? (square 4) 15 "Square is not equal to 15")
(report-success "Square of 4 is not 15")

(check-equal? (sum-of-squares 2 4) 20 "Sum-of-squares")
(report-success "Sum-of-squares of 2 and 4 is 20")

(check-equal? (sum-of-squares 5 5) 50 "Sum-of-squares")
(report-success "Sum-of-squares of 5 and 5 is 50")

(check-equal? (sum-of-squares-of-largest 2 4 5) 41 "Sum-of-squares-of-largest")
(report-success "Sum-of-squares-of-largest of 2 4 5 is is 41")

(check-equal? (sum-of-squares-of-largest 6 1 8) 100 "Sum-of-squares-of-largest")
(report-success "Sum-of-squares-of-largest of 6 1 8 is is 100")