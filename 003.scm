;; Gauche 0.9.3

(add-load-path "." :relative)
(use eulerlib)

(define (e3)
  (let1 v 600851475143
    (let loop ((ps (reverse (primes (floor->exact (sqrt v))))))
      (if (zero? (modulo v (car ps)))
          (car ps)
          (loop (cdr ps))))))