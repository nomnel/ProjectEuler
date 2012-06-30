;; Gauche 0.9.3

(add-load-path "." :relative)
(use eulerlib)
(use util.toposort)

(define (e79)
  (let ((v (make-vector 10 #f))
	(l (map integer->list
		(delete-duplicates (map string->number
					(read-file "./keylog.txt"))))))
    (dolist (i (delete-duplicates (fold (^(n p) (append n p)) '() l)))
      (vector-set! v i '()))
    (dolist (g l)
      (vector-set! v (car g) (cons (cadr g) (vector-ref v (car g))))
      (vector-set! v (cadr g) (cons (caddr g) (vector-ref v (cadr g)))))
    (let1 graph
	(let loop ((i 0) (r '()))
	  (cond ((< 9 i) r)
		((vector-ref v i)
		 (loop (+ i 1) (cons (append `(,i) (delete-duplicates (vector-ref v i)))
				     r)))
		(else (loop (+ i 1) r))))
      (list->integer (topological-sort graph)))))