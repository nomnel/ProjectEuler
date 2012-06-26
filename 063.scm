;; Gauche 0.9.3

(add-load-path "." :relative)
(use eulerlib)

(define (e63)
  (let1 r '()
    (dolist (b (iota 21 1))
      (dolist (a (iota 9 1))
	(when (= b (length (integer->list (expt a b))))
	  (set! r (cons (expt a b) r)))))
    (length (delete-duplicates r))))