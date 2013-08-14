(add-load-path "." :relative)
(use eulerlib)

(define (e20)
  (apply + (integer->list (apply * (range 100 0)))))