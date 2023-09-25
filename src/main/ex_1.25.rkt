#lang racket

(define (expmod base exp m)
  (remainder (fast-expt base exp) m))

(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))


(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

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

; New expmod fast-expt grows very fast and leads to numerical overflow with big number.
; Test result of the timed-prime-test procedure from ex_1.24:
; 1009 *** 0.10400390625
; 1013 *** 0.10498046875
; 1019 *** 0.10791015625
; 10007 *** 0.130126953125
; 10009 *** 0.125
; 1000037 *** 0.226806640625
; Test result of the with new exmod:
; 1009 *** 19.91015625
; 1013 *** 4.24609375
; 1019 *** 5.451904296875
; 10007 *** 313.474853515625
; 10009 *** 271.3359375
; 1000037 *** 331992.89599609375