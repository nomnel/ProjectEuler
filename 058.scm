;; Gauche 0.9.3

(add-load-path "." :relative)
(use eulerlib)

(define (e58)
  (let loop ((l 3) (c 0) (d 5))
    (let* ((m (* l l))
	   (c (+ c
		 (if (prime? (- m (* 1 (- l 1)))) 1 0)
		 (if (prime? (- m (* 2 (- l 1)))) 1 0)
		 (if (prime? (- m (* 3 (- l 1)))) 1 0))))
      (if (> 1/10 (/ c d))
	  l
	  (loop (+ l 2) c (+ d 4))))))