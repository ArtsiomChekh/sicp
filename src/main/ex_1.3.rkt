#lang racket

(provide square sum-of-squares sum-of-squares-of-largest)

(define (square x) (* x x))

(define (sum-of-squares a b) (+ (square a) (square b)))

(define (sum-of-squares-of-largest a b c)
  (cond ((and (>= b a) (>= c a)) (sum-of-squares b c))
        ((and (>= a b) (>= c b)) (sum-of-squares a c))
        ((and (>= a c) (>= b c)) (sum-of-squares a b))))