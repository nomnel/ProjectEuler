;; Gauche 0.9.3

(add-load-path "." :relative)
(use eulerlib)

(define (e30)
  (let1 m (* 5 (expt 9 5))
    (let loop ((n 2) (s 0))
      (cond ((< m n) s)
	    ((= n (apply + (map (cut expt <> 5) (integer->list n))))
	     (loop (+ n 1) (+ s n)))
	    (else (loop (+ n 1) s))))))