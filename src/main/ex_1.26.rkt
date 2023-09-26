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
         (remainder (* (expmod base (/ exp 2) m)
                       (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base
                       (expmod base (- exp 1) m))
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

; (timed-prime-test 1000000007)
; Solution:
; We can compare the two timed-prime-test procedures.
;
; Evaluates from ex. 1.24:
; 1009 *** 0.10107421875
; 1013 *** 0.10693359375
; 1019 *** 0.110107421875
; 10007 *** 0.130859375
; 10009 *** 0.1259765625
; 10037 *** 0.132080078125
; 100003 *** 0.14794921875
; 100019 *** 0.157958984375
; 100043 *** 0.1650390625
; 1000003 *** 0.169921875
; 1000033 *** 0.175048828125
; 1000037 *** 0.217041015625
;
; Evaluates using the new expmod procedure:
; 1009 *** 13.427001953125
; 1013 *** 9.844970703125
; 1019 *** 10.508056640625
; 10007 *** 216.2880859375
; 10009 *** 132.597900390625
; 10037 *** 143.61279296875
; 100003 *** 1543.137939453125
; 100019 *** 1561.007080078125
; 100043 *** 1542.907958984375
; 1000003 *** 13807.8369140625
; 1000033 *** 13790.950927734375
; 1000037 *** 13829.2900390625
;
; Summarize:
; We clearly see a significant difference in time complexity.
; If our 'exp' is even, we call exmod recursively twice,
; so we get O(n) complexity time in the bad case