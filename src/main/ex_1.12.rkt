#lang racket

(provide pascal)

(define (pascal c r)
  (if (or (= c 0) (= c r))
      1
      (+ (pascal (- c 1) (- r 1))
         (pascal c (- r 1)))))