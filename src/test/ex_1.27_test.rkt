#lang racket

(require rackunit
         rackunit/text-ui
         "../main/ex_1.27.rkt")

; Carmichael numbers: 561, 1105, 1729, 2465, 2821, 6601
(run-tests
 (test-suite
  "ex_1.27.rkt"
  (check-equal?  (carmichael? 561) #t)
  (check-equal?  (carmichael? 1105) #t)
  (check-equal?  (carmichael? 1729) #t)
  (check-equal?  (carmichael? 2465) #t)
  (check-equal?  (carmichael? 2821) #t)
  (check-equal?  (carmichael? 6601) #t)

  (check-equal?  (carmichael? 2822) #f)
  (check-equal?  (carmichael? 6602) #f)
  ))