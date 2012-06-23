;; Gauche 0.9.3

(add-load-path "." :relative)
(use eulerlib)
(use srfi-1)

; 分子の10の位 = 分母の1の位 かつ 分子の1の位*分母 = 分母の10の位*分子
; もしくは
; 分子の1の位 = 分母の10の位 かつ 分子の10の位*分母 = 分母の1の位*分子
; となるような分子, 分母のペアを求めればよい
(define (e33)
  (apply * (append-map
	    (^x (map (^y (cond ((and (= (quotient x 10) (modulo y 10))
				     (= (* (modulo x 10) y) (* (quotient y 10) x)))
				(/ x y))
			       ((and (= (modulo x 10) (quotient y 10))
				     (= (* (quotient x 10) y) (* (modulo y 10) x)))
				(/ x y))
			       (else 1)))
		     (iota (- 99 x) (+ x 1))))
	    (filter (^n (not (zero? (modulo n 11))))
		    (range 11 100)))))