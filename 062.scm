;; Gauche 0.9.3

(add-load-path "." :relative)
(use eulerlib)

(define (e62)
  (let1 ht (make-hash-table)
    (let loop ((n 346))
      (let* ((cube (expt n 3))
	     (i (list->integer (sort (integer->list cube) >))))
	(hash-table-push! ht i cube)
	(if (= 5 (length (hash-table-get ht i)))
	    (apply min (hash-table-get ht i))
	    (loop (+ n 1)))))))