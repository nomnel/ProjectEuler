;; Gauche 0.9.3

(add-load-path "." :relative)
(use eulerlib)

; 1000<p<10000 なる素数pと同じ数字の組み合わせで作られる数iが
; 素数かつ p<i で
; さらにp i j が等差数列となるようにjをとったとき
; jが素数かつpと同じ数の組み合わせで作られていれば
; そのp i jが求める答えになる
(define (e49)
  (call/cc (^(return)
	     (for-each
	      (^p (for-each
		   (^i (when (and (< p i) (prime? i))
			 (let1 j (+ i (- i p))
			   (when (and (< j 10000)
				      (prime? j)
				      (= (list->integer (sort (integer->list p)))
					 (list->integer (sort (integer->list j)))))
			     (return (list->integer (list p i j)))))))
		   (map list->integer (permutations* (integer->list p)))))
	      ($ delete 1487 $ filter (cut < 1000 <>) $ primes 10000)))))