;; Gauche 0.9.3

(add-load-path "." :relative)
(use eulerlib)

; 偶数と5が含まれていると, それらが1の位に来たときに割り切れる
; 9, 1が先頭や末尾にあると, 1桁のときに素数でなくなってしまう
; 39が先頭や末尾にあると, 2桁のときに素数でなくなってしまう
; 他に11, 33, 77, 99が含まれていてもダメだが, 面倒なので省略
(define (e37)
  (let* ((ps (primes 1000000))
	 (p? ((^h (dolist (p ps) (hash-table-put! h p #t))
		  (^n (hash-table-get h n #f)))
	      (make-hash-table)))
	 (truncatable?
	  (^p (let1 l (integer->list p)
		(and (< 10 p)
		     (or (< p 100)
			 (not (any (^n (or (even? n) (= 5 n))) l))) ; !/[024568]/
		     (not (or (= 9 (car l)) (= 1 (car l))           ; !/^[91]/
			      (= 9 (last l)) (= 1 (last l))         ; !/[91]$/
			      (and (= 3 (car l)) (= 9 (cadr l)))    ; !/^39/
			      (and (= 3 (car (reverse l)))          ; !/39$/
				   (= 9 (cadr (reverse l))))))
		     (let l-loop ((l (cdr l)))
		       (cond ((null? l) #t)
			     ((p? (list->integer l))
			      (l-loop (cdr l)))
			     (else #f)))
		     (let r-loop ((p (quotient p 10)))
		       (cond ((zero? p) #t)
			     ((p? p) (r-loop (quotient p 10)))
			     (else #f))))))))
	 (let loop ((ps ps) (res '()))
	   (if (null? ps)
	       (apply + res)
	       (loop (cdr ps) (if (truncatable? (car ps))
				  (cons (car ps) res)
				  res))))))