;; Gauche 0.9.3

(define (e29)
  (let1 ht (make-hash-table 'eqv?)
    (dolist (a (iota 99 2))
      (dolist (b (iota 99 2))
              (hash-table-put! ht (expt a b) #t)))
    (length (hash-table-keys ht))))