#lang racket

(define (cube x)
  (* x x x))

(define (p x)
  (- (* 3 x) (* 4 (cube x))))

(define (sine angle)
  (if (not (> (abs angle) 0.1))
      angle
      (p (sine (/ angle 3.0)))))

; Solution:
;
; a: When (sine 12.15) is evaluated the p procedure is applied 5 times.
;(sine 12.15) -> -0.39980345741334
;(if (not ( > 12.15 0.1)) 12.15 (p (sine 4.05)))
;(if (not ( > 12.15 0.1)) 12.15 (p (if (not ( > 4.05 0.1)) 4.05 (p (sine 1.35)))))
;(if (not ( > 12.15 0.1)) 12.15 (p (if (not ( > 4.05 0.1)) 4.05 (p (if (not ( > 1.35 0.1)) 1.35 (p (sine 0.45)))))))
;(if (not ( > 12.15 0.1)) 12.15 (p (if (not ( > 4.05 0.1)) 4.05 (p (if (not ( > 1.35 0.1)) 1.35 (p (if (not ( > 0.45 0.1)) 0.45 (p (sine 0.15)))))))))
;(if (not ( > 12.15 0.1)) 12.15 (p (if (not ( > 4.05 0.1)) 4.05 (p (if (not ( > 1.35 0.1)) 1.35 (p (if (not ( > 0.45 0.1)) 0.45 (p (if (not ( > 0.15 0.1)) 0.15 (p (sine 0.05)))))))))))
;> (p 0.05)
;0.14950000000000002
;> (p 0.14950000000000002)
;0.43513455050000005
;> (p 0.43513455050000005)
;0.9758465331678772
;> (p 0.9758465331678772)
;-0.7895631144708228
;> (p -0.7895631144708228)
;-0.39980345741334
;
; b: The sine procedure is recursive and is called once within the body.
; 