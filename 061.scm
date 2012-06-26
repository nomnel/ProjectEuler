;; Gauche 0.9.3

(add-load-path "." :relative)
(use eulerlib)
(use srfi-1)

(define (e61)
  (define (make-polygonals p)
    (let1 fn (polygonal-formula p)
      (let loop ((n 1) (r '()))
	(let1 v (fn n)
	  (if (< 9999 v)
	      (filter (^i (< 9 (modulo i 100))) r)
	      (loop (+ n 1) (if (< 999 v) (cons v r) r)))))))
  (define polygonals-by
    (let1 v (make-vector 8)
      (dolist (p (range 3 8))
	(let1 ht (make-hash-table)
	  (dolist (n (make-polygonals p))
	    (hash-table-put! ht (quotient n 100)
			     (cons (modulo n 100)
				   (hash-table-get ht (quotient n 100) '()))))
	  (vector-set! v p ht)))
      (^(p dd)
	(let1 l (hash-table-get (vector-ref v p) dd #f)
	  (if (not l) '()
	      (map (^(ee) `(,p ,(+ (* 100 dd) ee))) l))))))
  
  (call/cc
    (^(return)
      (dolist (8-nal (make-polygonals 8))
	(let loop ((p-nal 8-nal) (l '()) (pols (range 3 8)))
	  (if (null? pols)
	      (when (= (modulo p-nal 100) (quotient 8-nal 100))
		(return (apply + (cons p-nal l))))
	      (let1 candidates (filter (^l (not (null? l)))
				       (append-map (^p (polygonals-by p (modulo p-nal 100))) pols))
		(unless (null? candidates)
		  (map (^c (loop (cadr c) (cons p-nal l) (delete (car c) pols)))
		       candidates)))))))))