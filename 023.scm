;; Gauche 0.9.3

(add-load-path "." :relative)
(use eulerlib)

(define (e23)
  (let* ((m 28123)
	 (ps (primes (quotient m 2)))
	 (fv (make-vector (+ m 1) #f))
	 (al (filter (^n (< n (sum-proper-divisors n ps)))
		     (iota m 1))))
    (dolist (a al) (vector-set! fv a #t))
    (apply + (remove (^x (any (^y (vector-ref fv (- x y)))
			      (filter (cut > x <>) al)))
		     (iota m 1)))))