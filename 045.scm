(add-load-path "." :relative)
(use eulerlib)

; 六角数をチェックしていくだけ
(define (e45)
  (define triangle?
    (memorize (^y (let1 x (/ (- (sqrt (+ 1 (* 8 y))) 1) 2)
                    (= x (floor->exact x))))))
  (define pentagonal?
    (memorize (^y (let1 x (/ (+ 1 (sqrt (+ 1 (* 24 y)))) 6)
                    (= x (floor->exact x))))))
  (define hexagonal (polygonal-formula 6))
  (let loop ((n 144) (v 41328))
    (if (and (triangle? v) (pentagonal? v))
        v
        (loop (+ n 1) (hexagonal (+ n 1))))))