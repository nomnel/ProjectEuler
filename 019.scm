(define (e19)
  (let ((sd (modulo (+ 1 365) 7))
        (ml (let mloop ((l '()) (yl (iota 100 1901)))
              (if (null? yl) l
                  (mloop (append l `(31 ,(if (zero? (modulo (car yl) 4)) 29 28) 31 30 31 30 31 31 30 31 30 31))
                         (cdr yl))))))
    (let loop ((d sd) (res (if (zero? sd) 1 0)) (ml ml))
      (if (null? ml)
          res
          (loop (modulo (+ d (car ml)) 7)
                (if (zero? d) (+ 1 res) res)
                (cdr ml))))))