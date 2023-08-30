#lang racket
(define (square x)
  (* x x))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(define (improve guess x)
        (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

; Solution:
; Computing small numbers (sqrt (square 0.01)) gives us result 0.03230844833048122  
; Computing large numbers (sqrt (square 111111111111111111)) gives us infinite evaluating
; Floating point numbers have limited precision (0.001),
; which means that very large numbers can result in a loss of precision.

; An altetnative stratege for implementing good-enough:
; ???