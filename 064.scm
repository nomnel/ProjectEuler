(add-load-path "." :relative)
(use eulerlib)

(define (e64)
  (define (square? n)
    (= n (expt (floor->exact (sqrt n)) 2)))
  (let loop ((n 2) (r 0))
    (if (> n 10000) r
        (loop (+ n 1)
              (if (and (not (square? n))
                       (odd? (length (cadr (continued-fraction n)))))
                  (+ r 1) r)))))