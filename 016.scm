(add-load-path "." :relative)
(use eulerlib)

(define (e16)
  (apply + (integer->list (expt 2 1000))))