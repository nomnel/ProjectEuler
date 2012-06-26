;; Gauche 0.9.3

(add-load-path "." :relative)
(use eulerlib)

(define (e64)
  (let loop ((n 2) (res 0))
    (if (< 10000 n) res
	(let1 lim (floor->exact (sqrt n))
	  (if (= n (* lim lim))
	      (loop (+ n 1) res)
	      (let loop2 ((r lim) (k 1) (period 0))
		(if (or (not (= k 1)) (zero? period))
		    (let1 k (/ (- n (* r r)) k)
		      (loop2 (- (* (quotient (+ lim r) k) k) r)
			     k (+ period 1)))
		    (loop (+ n 1) (if (odd? period) (+ res 1) res)))))))))