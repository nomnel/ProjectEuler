(define-module eulerlib
  (use srfi-1)
  (use srfi-42)
  (export range
	  primes
	  integer->list
	  list->integer
	  palindrome?
	  factorize
	  polygonal-formula
	  sum-proper-divisors
	  prime?
	  memorize
	  pandigital?
	  is?
	  prime-factors
	  read-file
	  continued-fraction
	  extract-sqrt
	  real->list))

(select-module eulerlib)

; (range 1 10) => (1 2 3 4 5 6 7 8 9)
; (range 10 1 3) => (10 7 4)
(define (range start stop :optional (step 1))
  (list-ec (:range i start stop ((if (< start stop) + -) step)) i))

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

; returns closure evaluate nth p-gonal number.
(define (polygonal-formula p)
  (^n (/ (- (* (- p 2) (* n n))
	    (* (- p 4) n))
	 2)))

; sum of proper divisors
(define (sum-proper-divisors n ps)
  (let1 d (apply * (map
		    (^l (apply + (map (cut expt (car l) <>)
				      (iota (+ 1 (cadr l))))))
		    (factorize n ps)))
    (- d (if (= d 1) 0 n))))

; 試し割り
(define (prime? n)
  (cond ((= n 2) #t)
	((or (< n 2) (even? n)) #f)
	(else (let1 m (floor->exact (sqrt n))
		(let loop ((i 3))
		  (cond ((< m i) #t)
			((zero? (modulo n i)) #f)
			(else (loop (+ i 2)))))))))

; returns closure memorized-pred".
(define (memorize pred :key (true-list '()) (type 'eq?))
  (let1 ht (make-hash-table type)
    (unless (null? true-list)
      (dolist (v true-list) (hash-table-put! ht v #t)))
    (^v (if (hash-table-exists? ht v)
	    (hash-table-get ht v))
	    (let1 b (pred v)
	      (hash-table-put! ht v b) b))))

(define (pandigital? n :optional (d 9))
  (equal? (iota d 1) (sort (integer->list n))))

(define (is? ls :optional (type 'eq?))
  (let1 ht (make-hash-table type)
    (dolist (v ls)
      (hash-table-put! ht v #t))
    (^v (hash-table-get ht v #f))))

(define (prime-factors n ps)
  (define (cont-div n d)
    (let loop ((n n))
      (if (zero? (modulo n d))
	  (loop (quotient n d))
	  n)))
  (let loop ((n n) (ps ps) (r '()))
    (cond ((or (null? ps) (< n (car ps))) r)
	  ((zero? (modulo n (car ps)))
	   (loop (cont-div n (car ps)) (cdr ps) (cons (car ps) r)))
	  (else (loop n (cdr ps) r)))))

(define (read-file file :optional (do-each #f))
  (let1 fn (if do-each (cut do-each <>) (^l l))
    (call-with-input-file file
      (^f (let loop ((ln (read-line f)) (r '()))
	    (if (eof-object? ln)
		(reverse r)
		(loop (read-line f) (cons (fn ln) r))))))))

(define (continued-fraction D)
  (let1	 a0 (floor->exact (sqrt D))
    (let loop ((pn-1 0) (qn-1 1) (a `(,a0)) (period 0))
      (if (= (car a) (* 2 a0))
	  `(,a0 ,(cdr (reverse a)))
	  (let* ((pn (- (* (car a) qn-1) pn-1))
		 (qn (/ (- D (* pn pn)) qn-1))
		 (an (quotient (+ a0 pn) qn)))
	    (loop pn qn (cons an a) (+ period 1)))))))

; 開平法
(define (extract-sqrt n p)
  (define (biggest-x bring-down tgt)
    (let* ((l (take-while (^i (>= tgt (* i (+ (* 10 bring-down) i))))
			  (iota 10)))
	   (r (last l)))
      (values r (* r (+ (* 10 bring-down) r)))))
  
  (receive (1st rest)
      (let* ((r (real->list n))
	     (l (append (car r) (cadr r) (circular-list 0))))
	(split-at l (if (odd? (length (car r))) 1 2)))
    (let loop ((ans '()) (tgt (list->integer 1st))
	       (sum 0) (rest rest))
      (receive (x mul) (biggest-x sum tgt)
	(let1 ans (cons x ans)
	  (if (<= p (length ans))
	      (reverse ans)
	      (loop ans
		    (list->integer `(,(- tgt mul) ,(car rest) ,(cadr rest)))
		    (+ (+ (* 10 sum) x) x)
		    (cddr rest))))))))

; (real->list 123.456789) => ((1 2 3) (4 5 6 7 8 9))
(define (real->list r)
  (map (^s (integer->list (string->number s)))
       (string-split (number->string (if exact? (exact->inexact r) r))
		     ".")))