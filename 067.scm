;; Gauche 0.9.3

(add-load-path "." :relative)
(use eulerlib)

(define (e67)
  (let1 l (read-file "./triangle.txt"
		     (^l (map string->number (string-split l " "))))
    (fold-right (^(x m)
		  (let1 k (map + x m)
		    (if (null? (cdr k))
			(car k)
			(map max k (cdr k)))))
		(iota (length l) 0 0)
		l)))