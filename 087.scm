(add-load-path "." :relative)
(use eulerlib)

(define (e87)
  (let* ((m 50000000)
         (res (make-hash-table))
         (sq-l (primes (floor->exact (expt m 1/2))))
         (cb-l (filter (^p (< p (expt m 1/3))) sq-l))
         (fr-l (filter (^p (< p (expt m 1/4))) cb-l)))
    (dolist (sq sq-l)
      (dolist (cb cb-l)
        (dolist (fr fr-l)
          (let1 s (+ (expt sq 2) (expt cb 3) (expt fr 4))
            (when (< s m)
              (hash-table-put! res s #t))))))
    (length (hash-table-keys res))))