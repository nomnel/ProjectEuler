;; Gauche 0.9.3

(add-load-path "." :relative)
(use eulerlib)

; 総当り
(define (e46)
  (let* ((ps (primes 10000))
	 (p? (is? ps))
	 (twice-a-square?
	  (is? (map (^n (* 2 n n)) (iota 100 1)))))
    (let loop ((n 3))
      (if (p? n)
	  (loop (+ n 2))
	  (let loop2 ((ps ps))
	    (cond ((null? ps) n)
		  ((twice-a-square? (- n (car ps)))
		   (loop (+ n 2)))
		  (else (loop2 (cdr ps)))))))))