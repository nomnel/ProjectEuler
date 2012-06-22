(define-module eulerlib
  (export range
	  primes
	  integer->list
	  list->integer
	  palindrome?
	  factorize
	  polygonal-formula))

(select-module eulerlib)

; (range 1 10) => (1 2 3 4 5 6 7 8 9)
; (range 10 1 3) => (10 7 4)
(define (range s e :optional (d 1))
  (let1 d ((if (<= s e) + -) (abs d))
    (iota (ceiling->exact (/. (abs (- s e)) (abs d)))
	  s d)))

;; Sieve of Eratosthenes
; (primes 10) => (2 3 5 7)
(define (primes n)
  (if (< n 2) '()
      (let1 m (floor->exact (sqrt n))
	(let loop ((l (range 3 (+ n 1) 2))
		   (ps '(2)))
	  (cond ((null? l) (reverse ps))
		((< m (car l)) (append (reverse ps) l))
		(else (loop (remove (^x (zero? (modulo x (car l)))) l)
			    (cons (car l) ps))))))))

; (integer->list 123) => (1 2 3)
; (integer->list -123) => (1 2 3)
(define (integer->list i)
  (let loop ((i (abs i)) (r '()))
    (if (< i 10)
	(cons i r)
	(loop (quotient i 10) (cons (modulo i 10) r)))))

; (list->integer '(12 3 45)) => 12345
(define (list->integer l)
  (define (shift-d i)
    (let loop ((d 10))
      (if (< i d) d (loop (* 10 d)))))
  (fold (^(n p) (+ (* p (shift-d n)) n)) 0 l))

; (palindrome? 123) => #f
; (palindrome? 121) => #t
(define (palindrome? n)
  (let1 l (integer->list n)
    (every = l (reverse l))))

; (factorize 20 '(2 3 5 7)) => ((2 2) (5 1))                                                                            
(define (factorize n ps)
  (map (^p (let loop ((n (/ n p)) (c 1))
	     (if (zero? (modulo n p))
		 (loop (/ n p) (+ c 1))
		 `(,p ,c))))
       (filter (^p (and (<= p n) (zero? (modulo n p))))
               ps)))

; return closure evaluate nth p-gonal number.
(define (polygonal-formula p)
  (^n (/ (- (* (- p 2) (* n n))
	    (* (- p 4) n))
	 2)))