;; Gauche 0.9.3

(add-load-path "." :relative)
(use eulerlib)

(define (e76)
  (let1 ways (make-vector 101 0)
    (vector-set! ways 0 1)
    (dolist (i (range 1 100))
      (dolist (j (range i 101))
	(vector-set! ways j (+ (vector-ref ways j)
			       (vector-ref ways (- j i))))))
    (vector-ref ways 100)))