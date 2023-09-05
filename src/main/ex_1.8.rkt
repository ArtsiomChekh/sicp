#lang racket
(define (cube x)
  (* x x x))

(define (square x)
  (* x x))

(define (cubert x)
  (cube-iter 1.0 x))

(define (improve guess x)
   (/ (+ (/ x (square guess))
         (* 2 guess))
      3))

(define (average x y)
  (/ (+ x y) 2))

(define (cube-iter guess x)
  (if (good-enough? guess x)
      guess
      (cube-iter (improve guess x) x)))

(define (good-enough? guess x)
  (< (abs (- (cube guess) x)) 0.001))

; Test:
; (cubert 8) => 2.000004911675504
; (cubert 64) => 4.000017449510739
; (cubert 125) => 5.000000000287929
; (cubert 1000000) => 100.00000000005313