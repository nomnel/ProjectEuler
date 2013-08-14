(add-load-path "." :relative)
(use eulerlib)

(define (e73)
  (let1 res 0
    (dolist (d (range 5 12001))
      (dolist (n (range (floor->exact (+ 1 (/ d 3)))
                        (floor->exact (+ 1 (/ (- d 1) 2)))))
        (when (= 1 (gcd n d)) (inc! res))))
    res))