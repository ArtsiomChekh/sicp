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
; ***
; Computing small numbers < 0.001 (sqrt 0.0000000001) gives us result 0.03125000106562499.
; After this we compute (square 0.03125000106562499) and we will get the not precise enough
; result 0.000976562566601563 < 0.001
; Computing very large numbers (sqrt 11111111111111111111111111111111111111) gives us infinite evaluating.
; ***
; An altetnative stratege for implementing good-enough:
; ----------------------------------------------------------
; (define (good-enough? guess x)
;  (< (abs (- guess (improve guess x))) (/ guess 1000000)))
; ----------------------------------------------------------
; Computing small numbers < 0.001 (sqrt 0.0000000001) gives us result 1.0000000015603234e-5
; Computing very large numbers (sqrt 11111111111111111111111111111111111111) gives us result 3.33333333495636e+18
; This new implementing works better with very large number. But evantually floating point numbers have limited precision,
; which means that numbers can result in a loss of precision.