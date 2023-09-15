#lang racket

(provide gcd)

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

; The normal order evaluation has > 10 remainder:
; (gcd 206 40)
; (if (= 40 0) 206 (gcd 40 (remainder 206 40))
; (if (= 40 0) 206 (if (= (remainder 206 40) 0) 40 (gcd (remainder 206 40) (remainder 40 (remainder 206 40)))) +4r
; (if (= 40 0) 206 (if (= (remainder 206 40) 0) 40 (if (= (remainder 40 (remainder 206 40)) 0) (remainder 206 40) (gcd (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
; ...

; The applicative-order evaluation has 4 remainder:
; (gcd 206 40) 
; (gcd 40 (remainder 206 40)) 
; (gcd 40 6) 
; (gcd 6 (remainder 40 6)) 
; (gcd 6 4) 
; (gcd 4 (remainder 6 4)) 
; (gcd 4 2) 
; (gcd 2 (remainder 4 2)) 
; (gcd 2 0) 
; 2 