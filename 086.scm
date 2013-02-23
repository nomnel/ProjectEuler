;; Gauche 0.9.3

(add-load-path "." :relative)
(use eulerlib)

(define (e86)
  (let loop ((c 0) (M 1))
    (if (> c 1000000) (- M 1)
        (let1 2M (* 2 M)
          (let loop2 ((c c) (N 2))
            (if (> N 2M)
                (loop c (+ M 1))
                (let1 d (sqrt (+ (expt M 2) (expt N 2)))
                  (loop2 (if (= d (floor d))
                             (+ c (if (<= N M)
                                      (floor->exact (/. N 2))
                                      (+ 1 (- M (floor->exact (/. (+ N 1) 2))))))
                             c)
                         (+ N 1)))))))))