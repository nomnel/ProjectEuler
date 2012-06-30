;; Gauche 0.9.3

(add-load-path "." :relative)
(use eulerlib)

(define (e77)
  (let1 ps (primes 100)
    (let loop ((target 11))
      (let1 ways (make-vector (+ target 1) 0)
	(vector-set! ways 0 1)
	(dolist (i ps)
	  (when (< i (+ target 1))
	    (dolist (j (range i (+ target 1)))
	      (vector-set! ways j (+ (vector-ref ways j)
				     (vector-ref ways (- j i)))))))
	(if (< 5000 (vector-ref ways target))
	    target
	    (loop (+ 1 target)))))))