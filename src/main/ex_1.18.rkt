#lang racket

(provide double halve even? multiply)

(define (double n)
  (* n 2))

(define (halve n)
  (quotient n 2))

(define (even? n)
  (= (remainder n 2) 0))

; Russian peasant method
(define (multiply a b)
  (define (iter acc a b)
    (cond ((< a 1) acc)
          ((even? a) (iter acc (halve a) (double b)))
          (else (iter (+ acc b) (halve a) (double b)))))
  (iter 0 a b))
