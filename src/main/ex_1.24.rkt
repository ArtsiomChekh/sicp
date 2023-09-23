#lang racket

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

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
  (fast-prime? n 100))

(define (square x) (* x x))

(timed-prime-test 1009) 
(timed-prime-test 1013) 
(timed-prime-test 1019) 
(timed-prime-test 10007) 
(timed-prime-test 10009) 
(timed-prime-test 10037) 
(timed-prime-test 100003) 
(timed-prime-test 100019) 
(timed-prime-test 100043) 
(timed-prime-test 1000003) 
(timed-prime-test 1000033) 
(timed-prime-test 1000037)

(timed-prime-test 1000000007)
(timed-prime-test 1000000009)
(timed-prime-test 1000000021)

; Solution:
; Test result of the timed-prime-test procedure from ex_1.22:
; 1009 *** 0.004150390625
; 1013 *** 0.004150390625
; 1019 *** 0.00390625
; 10007 *** 0.0068359375
; 10009 *** 0.0068359375
; 10037 *** 0.006103515625
; 100003 *** 0.02001953125
; 100019 *** 0.02001953125
; 100043 *** 0.02001953125
; 1000003 *** 0.06103515625
; 1000033 *** 0.06005859375
; 1000037 *** 0.06005859375
; 1000000007 *** 7.4111328125
; 1000000009 *** 1.868896484375
; 1000000021 *** 2.927001953125
;
; Test result of the timed-prime-test procedure with Fermat test:
; 1009 *** 0.130859375
; 1013 *** 0.137939453125
; 1019 *** 0.14013671875
; 10007 *** 0.169921875
; 10009 *** 0.160888671875
; 10037 *** 0.1689453125
; 100003 *** 0.19287109375
; 100019 *** 0.200927734375
; 100043 *** 0.198974609375
; 1000003 *** 0.218017578125
; 1000033 *** 0.219970703125
; 1000037 *** 0.226806640625
; 1000000007 *** 0.3310546875
; 1000000009 *** 0.3251953125
; 1000000021 *** 0.324951171875
;
; Summarize:
; After modifying the timed-prime-test procedure using Fermat's method,
; we see not the best result on the 12 prime numbers from ex. 1.22.
; By increasing the size of the numbers,
; we see that the computation time using Fermat's method increases only slightly.
