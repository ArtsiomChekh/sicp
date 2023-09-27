#lang racket

(provide carmichael?)

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (carmichael? n)
  (define (loop num a)
    (if (= num a)
        true
        (if (= (expmod a num num) a)
            (loop num (+ a 1))
            false)))
  (loop n 1))

(define (square x) (* x x))