;; Gauche 0.9.3

(add-load-path "." :relative)
(use eulerlib)

(define (e60)
  (define (satisfy? l p)
    (let1 pl (integer->list p)
      (if (every prime?
		 (append-map
		  (^i (let1 m (integer->list i)
			`(,(list->integer (append pl m))
			  ,(list->integer (append m pl)))))
		  l))
	  (cons p l)
	  #f)))
  (let1 ps (delete 5 (delete 2 (primes 10000)))
    (call/cc
      (^(return)
	(dolist (p ps)
	  (let loop ((l `(,p)) (ps (cdr (member p ps))))
	    (cond ((null? ps) #f)
		  ((satisfy? l (car ps))
		   => (^m (if (= (length m) 5)
			      (return (apply + m))
			      (unless (loop m (cdr ps))
				(loop l (cdr ps))))))
		  (else (loop l (cdr ps))))))))))