;; Gauche 0.9.3

(add-load-path "." :relative)
(use eulerlib)

(define (e12)
  (let ((ps (primes 50))
	(triangle (polygonal-formula 3)))
    (let loop ((n 29))
      (let1 c (apply * (map (^l (+ 1 (cadr l))) (factorize (triangle n) ps)))
	(if (< 500 c)
	    (triangle n)
	    (loop (+ n 1)))))))