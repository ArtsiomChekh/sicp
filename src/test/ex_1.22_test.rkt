#lang racket

(require rackunit
         rackunit/text-ui
         "../main/ex_1.22.rkt")

(run-tests
 (test-suite
  "ex_1.22.rkt"
  (search-for-primes 1000)
  (search-for-primes 10000)
  (search-for-primes 100000)
  (search-for-primes 1000000)
  ))