;; Gauche 0.9.3

(add-load-path "." :relative)
(use eulerlib)

(define (e56)
  (apply max
         (map (^a (apply max
                         (map (^b (apply + (integer->list (expt a b))))
                              (iota 99 1))))
              (iota 99 1))))