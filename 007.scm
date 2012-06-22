;; Gauche 0.9.3

(add-load-path "." :relative)
(use eulerlib)

(define (e7)
  (list-ref (primes 200000) 10000)