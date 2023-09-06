#lang racket

(define (p) (p))

(define (test x y)
  (if (= x 0) 0 y))

; Solution:
; Ben Bitdiddle will observe an infinite loop,
; because uses applicative-order evaluation assumes
; that the argument is evaluated before the function is applied.
; (test 0 (p)) => infinite loop

; If Ben Bitdiddle would use normal order evaluation,
; then the argument is evaluated only if it is needed.
; (test 0 (p)) => 0


