;; Gauche 0.9.3

(add-load-path "." :relative)
(use eulerlib)

(define (e16)
  (apply + (integer->list (expt 2 1000))))