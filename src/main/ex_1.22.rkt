#lang racket

(provide search-for-primes)

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))(void)))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (runtime)
  (current-inexact-milliseconds))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (smallest-divisor n) (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b) (= (remainder b a) 0))

(define (square x) (* x x))

(define (search-for-primes start)
  (newline)
  (define (loop n current)
    (cond ((= n 0) 0)
          ((prime? current)
           (timed-prime-test current)
           (newline)
           (loop (- n 1) (+ current 1)))
          (else (loop n (+ current 1)))))

  (loop 3 start))

; Solution:
; Calculations:
; (search-for-primes 1000)
; (search-for-primes 10000)
; (search-for-primes 100000)
; (search-for-primes 1000000)
; Result:
; 1009 *** 0.0029296875
; 1013 *** 0.0009765625
; 1019 *** 0.001953125
; 10007 *** 0.00390625
; 10009 *** 0.0048828125
; 10037 *** 0.0048828125
; 100003 *** 0.01318359375
; 100019 *** 0.013916015625
; 100043 *** 0.014892578125
; 1000003 *** 0.037841796875
; 1000033 *** 0.037109375
; 1000037 *** 0.0380859375
; We see that our calculations have the order of growth Θ(√n). This is work even on a large numbers.
; We clearly see that the machine runs in a time proportional to the number of steps required for the calculation.