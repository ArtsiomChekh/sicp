#lang racket

(provide divides? smallest-divisor find-divisor)

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (square x) (* x x))

;Solution:
(displayln (smallest-divisor 199))
(displayln (smallest-divisor 1999))
(displayln (smallest-divisor 19999))