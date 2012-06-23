;; Gauche 0.9.3

; 全て足して下10桁のみ取り出す
(define (e48)
  (mod (apply + (map (^n (expt n n))
		     (iota 1000 1)))
       (expt 10 10)))