;; Gauche 0.9.3

; 1周毎の四隅の合計を足し続ける
(define (e28)
  (let loop ((len 1) (pos 1) (s 1) (d 2))
    (if (= len 1001) s
	(loop (+ len 2)
	      (+ pos (* 4 d))
	      (+ s (* 4 pos) (* 10 d))
	      (+ d 2)))))