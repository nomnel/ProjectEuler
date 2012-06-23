;; Gauche 0.9.3

(add-load-path "." :relative)
(use eulerlib)

; d * dddd = dddd
; dd * ddd = dddd
; の2パターンのみしかありえない
(define (e32)
  (define (divisors n)
    (let loop ((i (floor->exact (sqrt n))) (res '()))
      (if (< i 2) res
	  (loop (- i 1) (if (zero? (modulo n i))
			    (cons `(,i ,(/ n i)) res)
			    res)))))
  (apply + (map
	    (^n (if (any (^d (pandigital? (list->integer `(,(car d) ,(cadr d) ,n))))
			 (divisors n))
		    n 0))
	    (range 1234 10000))))