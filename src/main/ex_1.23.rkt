#lang racket

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

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))
      (void)))

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
        (else (find-divisor n (next test-divisor)))))

(define (divides? a b) (= (remainder b a) 0))

(define (square x) (* x x))

(define (next n)
  (if (= n 2)
      3
      (+ n 2)))

(search-for-primes 1000)
(search-for-primes 10000)
(search-for-primes 100000)
(search-for-primes 1000000)

; Solution:
;      NEW                   VS      OLD
; 1009 *** 0.0009765625      VS 1009 *** 0.0029296875
; 1013 *** 0.001953125       VS 1013 *** 0.001953125
; 1019 *** 0.001220703125    VS 1019 *** 0.001953125
; 10007 *** 0.00390625       VS 10007 *** 0.00390625
; 10009 *** 0.0029296875     VS 10009 *** 0.0048828125
; 10037 *** 0.00390625       VS 10037 *** 0.0048828125
; 100003 *** 0.010009765625  VS 100003 *** 0.01318359375
; 100019 *** 0.010009765625  VS 100019 *** 0.013916015625
; 100043 *** 0.010009765625  VS 100043 *** 0.014892578125
; 1000003 *** 0.031005859375 VS 1000003 *** 0.037841796875
; 1000033 *** 0.029052734375 VS 1000033 *** 0.037109375
; 1000037 *** 0.029052734375 VS 1000037 *** 0.0380859375
;
; We see that for small numbers we run about twice as fast.
; But when we evaluate large numbers, our time decreases by less than 2 times.
; This can be explained by the fact that an increase in the number of stages
; leads to an increase in the number of times the next procedure is used to obtain the next number