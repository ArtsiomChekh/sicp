#lang racket

(provide double halve even? multiply)

(define (* a b)
  (if (= b 0)
      0
      (+ a (* a (- b 1)))))

(define (double n)
  (* n 2))

(define (halve n)
  (/ n 2))

(define (even? n)
  (= (remainder n 2) 0))

(define (multiply a b)
  (cond ((= b 0) 0)
        ((even? b)(double (multiply a (halve b))))
        (else (+ a (multiply a (- b 1))))))