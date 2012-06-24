;; Gauche 0.9.3

(define (e6)
  (- (expt (apply + (iota 100 1)) 2)
     (apply + (map (cut expt <> 2) (iota 100 1)))))