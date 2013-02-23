;; Gauche 0.9.3
(define (e1)
  (apply + (filter (^i (or (zero? (modulo i 3))
                           (zero? (modulo i 5))))
                   (iota 1000))))