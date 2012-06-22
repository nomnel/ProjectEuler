;; Gauche 0.9.3

(define (e2)
  (let loop ((a 1) (b 2) (s 2))
    (let1 c (+ a b)
      (if (> c 4000000) s
	  (loop b c (if (even? c) (+ s c) s))))))