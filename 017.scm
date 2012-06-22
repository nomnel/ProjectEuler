;; Gauche 0.9.3

(define (e17)
  (let1 v (make-vector 1001 "")
    (for-each (^(i s) (vector-set! v i s))
	      (iota 19 1)
	      '("one" "two" "three" "four" "five" "six" "seven" "eight" "nine" "ten" "eleven" "twelve" "thirteen" "fourteen" "fifteen" "sixteen" "seventeen" "eighteen" "nineteen"))
    (for-each (^(i s)
		(for-each (^j
			    (vector-set! v (+ i j) (string-append s (vector-ref v j)))) 
			  (iota 10)))
	      (iota 9 20 10)
	      '("twenty" "thirty" "forty" "fifty" "sixty" "seventy" "eighty" "ninety"))
    (for-each (^i
		(for-each (^j
			    (vector-set! v (+ (* i 100) j)
					 (string-append (vector-ref v i) "hundred"
							(if (not (zero? j))
							    (string-append "and" (vector-ref v j))
							    ""))))
			  (iota 100)))
	      (iota 9 1))
    (vector-set! v 1000 "onethousand")
    (apply + (map (^i (string-length (vector-ref v i))) (iota 1000 1)))))