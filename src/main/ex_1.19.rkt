#lang racket

(provide fib) 

(define (fib n)
  (fib-iter 1 0 0 1 n))

(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count)
         (fib-iter a
                   b
                   (+ (* p p) (* q q)) 
                   (+ (* 2 p q) (* q q))
                   (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))

; Solution:
;
; T(pq):
; a1 = bq + aq + ap
; b1 = bp + aq
;
; T2(pq):
; a2 = b1 + a1q + a1p
; b2 = b1p + a1q
;
; Put a1, b1 into a2:
; a2 = (bp + aq)q + (bq + aq + ap)q + (bq + aq + ap)p =
; bpq + aq^2 + bq^2 + aq^2 + apq + bpq + apq + ap^2 =
; a(2pq + q^2) + a(p^2 + q^2) + b(2pq + q^2)
;
; Put a1, b1 into a2:
; b2 = (bp + aq)p + (bq + aq + ap)q =
; bp^2 + apq + bq^2 + aq^2 + apq =
; b(p^2 + q^2) + a(2pq + q^2)
;
; If p1 = (p^2 + q^2) and q1 = (2pq + q^2)
; We have:
; a2 = bq1 + aq1 + ap
; b2 = bp1 + aq1


