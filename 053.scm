(add-load-path "." :relative)
(use eulerlib)

; nCr = nCn-r だが十分早く計算できるので使わなかった
(define (e53)
  (define (combination-count n r)
    (if (or (zero? r) (zero? n))
        1
        (/ (apply * (iota r (+ 1 (- n r))))
           (apply * (iota r 1)))))
  (let loop ((n 23) (r 1) (res 0))
    (cond ((< 100 n) res)
          ((< n r) (loop (+ n 1) 1 res))
          (else (loop n (+ r 1) (if (< 1000000 (combination-count n r))
                                    (+ res 1) res))))))