#lang racket

(provide rec-func iter-func)

; Recursive process
(define (rec-func n)
  (cond ((< n 3) n)
        (else (+ (rec-func(- n 1))
                 (rec-func(- n 2))
                 (rec-func(- n 3))))))

; Iterative process
(define (iter-func n)
  (define (loop a b c count)
    (if (= count 0) c (loop (+ a b c) a b (- count 1))))
  (loop 2 1 0 n))
