;; Gauche 0.9.3

(add-load-path "." :relative)
(use eulerlib)

(define (e34)
  (let1 v (make-vector 10 1)
    (dolist (i (iota 9 1))
            (vector-set! v i (* i (vector-ref v (- i 1)))))
    (apply + (filter (^n (= n (apply + (map (cut vector-ref v <>)
                                            (integer->list n)))))
                     (iota (- (* 7 (vector-ref v 9)) 10) 11)))))