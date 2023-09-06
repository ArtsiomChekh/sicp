#lang racket

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

; Solution:
; This procedure allows us to sum up two elements a and absolute value of b
; Test 1: (a-plus-abs-b 1 -1) = 1 + |-1| => 2
; Test 2: (a-plus-abs-b -1 -1) = -1 + |-1| => 0
; Test 3: (a-plus-abs-b -1 2) = -1 + |2| => 1

