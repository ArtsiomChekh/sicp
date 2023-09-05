#lang racket
(define (square x) (* x x))
(define (sum-of-squares a b) (+ (square a) (square b)))
(define (sum-of-squares-of-largest a b c)
  (cond ((and (>= b a) (>= c a)) (sum-of-squares b c))
           ((and (>= a b) (>= c b)) (sum-of-squares a c))
           (else (sum-of-squares a b))))