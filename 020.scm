;; Gauche 0.9.3

(add-load-path "." :relative)
(use eulerlib)

(define (e20)
  (apply + (integer->list (apply * (range 100 0)))))