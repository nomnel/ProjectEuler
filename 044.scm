(add-load-path "." :relative)
(use eulerlib)

; 五角数に対して, それ以下の五角数全てとの和, 差をチェックする
(define (e44)
  (define pentagonal?
    (memorize (^y (let1 x (/ (+ 1 (sqrt (+ 1 (* 24 y)))) 6)
                    (= x (floor->exact x))))))
  (define pentagonal
    (polygonal-formula 5))
  (let loop ((n 2) (l '(1)))
    (let1 p (pentagonal n)
      (let loop2 ((pl l))
        (cond ((null? pl) (loop (+ n 1) (cons p l)))
              ((and (pentagonal? (+ p (car pl)))
                    (pentagonal? (- p (car pl))))
               (- p (car pl)))
              (else (loop2 (cdr pl))))))))