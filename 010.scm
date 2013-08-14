(add-load-path "." :relative)
(use eulerlib)

(define (e10)
  (apply + (primes 2000000)))