;; Gauche 0.9.3

(add-load-path "." :relative)
(use eulerlib)

(define (e80)
  (define (irrationals m)
    (filter (^i (inexact? (sqrt i))) (iota m 1)))
  ($ apply +
   $ map (^i (apply + (extract-sqrt i 100)))
   $ irrationals 100))