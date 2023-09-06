#lang racket

(define (square x)
  (* x x))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (new-sqrt-iter prev-guess guess x)
  (if (new-good-enough? prev-guess guess)
      guess
      (new-sqrt-iter guess (improve guess x) x)))

(define (new-sqrt x)
  (new-sqrt-iter 0 1.0 x))

(define (new-good-enough? prev-guess guess)
  (< (abs (- guess prev-guess))
     0.00001))

; Solution:
; A new strategy for implementing "good enough"? allows us to evaluate small
; and a cumbersome number with no infinite exceptions.