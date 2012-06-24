;; Gauche 0.9.3

(define (e14)
  (let1 memo (make-hash-table)
    (hash-table-put! memo 1 0)
    (dolist (n (iota 1000000 1))
      (let loop ((n n) (l '()))
	(cond ((hash-table-get memo n #f)
	       => (^c (let loop2 ((c (+ c 1)) (l l))
			(unless (null? l)
			  (hash-table-put! memo (car l) c)
			  (loop2 (+ c 1) (cdr l))))))
	      (else (loop (if (even? n) (/ n 2) (+ (* 3 n) 1))
			  (cons n l))))))
    (hash-table-fold memo
		     (^(k v p) (if (or (< 1000000 k)
				       (< v (hash-table-get memo p)))
				   p k))
		     1)))