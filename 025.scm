;; Gauche 0.9.3

(define (e25)
  (let1 m (expt 10 999)
    (let loop ((a 1) (b 1) (n 3))
      (let1 c (+ a b)
        (if (< m c) n
            (loop b c (+ n 1)))))))