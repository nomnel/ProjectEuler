;; Gauche 0.9.3

(define (e71)
  (let loop ((l 2/5) (r 3/7))
    (let1 M (/ (+ (numerator l) (numerator r))
               (+ (denominator l) (denominator r)))
      (if (< 1000000 (denominator M))
          (numerator l)
          (loop M r)))))