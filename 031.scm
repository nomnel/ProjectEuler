;; Gauche 0.9.3

; 動的計画法
(define (e31)
  (let ((coins '(200 100 50 20 10 5 2 1))
        (ways (make-vector 201 0)))
    (vector-set! ways 0 1)
    (dolist (coin coins)
            (dolist (i (iota (- 201 coin) coin))
                    (vector-set! ways i
                                 (+ (vector-ref ways i)
                                    (vector-ref ways (- i coin))))))
    (vector-ref ways 200)))