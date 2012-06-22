;; Gauche 0.9.3

(add-load-path "." :relative)
(use eulerlib)

(define (e10)
  (apply + (primes 2000000)))