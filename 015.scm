(add-load-path "." :relative)
(use eulerlib)

(define (e15)
  (/ (apply * (range 40 20))
     (apply * (range 20 0))))