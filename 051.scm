(add-load-path "." :relative)
(use eulerlib)

; 1の位に来れるのは1,3,7,9
; よって1の位は変化しない
; 数nの各桁の和が3の倍数ならnも3の倍数なので
; 1. 変化するのは3桁 となり
; 2. 求める答えは5桁か6桁 が言える
(define (e51)
  (define (prime-count-over? count candidates)
    (let loop ((r count) (l candidates) (1st 0))
      (cond ((= r 0) 1st)
            ((> r (length l)) #f)
            (else (let* ((i (list->integer (car l)))
                         (p? (prime? i)))
                    (loop (if p? (- r 1) r)
                          (cdr l)
                          (if (and p? (zero? 1st)) i 1st)))))))
  (call/cc
    (^(return)
       ; d = 5
       ; ***ab, **a*b, *a**b, a***b (b: 1,3,7,9)
       (dolist (a (iota 10))
         (dolist (b (filter (^b (not (zero? (modulo (+ a b) 3))))
                            (iota 10)))
           (cond ((prime-count-over?
                    8 (map (^x `(,x ,x ,x ,a ,b)) (iota 9 1)))
                  => (^r (return r)))
                 ((prime-count-over?
                    8 (map (^x `(,x ,x ,a ,x ,b)) (iota 9 1)))
                  => (^r (return r)))
                 ((prime-count-over?
                    8 (map (^x `(,x ,a ,x ,x ,b)) (iota 9 1)))
                  => (^r (return r)))
                 ((prime-count-over?
                    8 (map (^x `(,a ,x ,x ,x ,b)) (iota 9 1)))
                  => (^r (return r))))))
       ; d = 6
       ; ***abc, **a*bc, **ab*c, *a**bc, *a*b*c,
       ; *ab**c, a***bc, a**b*c, a*b**c, ab***c (c: 1,3,7,9)
       (dolist (a (iota 10))
         (dolist (b (iota 10))
           (dolist (c (filter (^c (not (zero? (modulo (+ a b c) 3))))
                              '(1 3 7 9)))
             (cond ((prime-count-over?
                      8 (map (^x `(,x ,x ,x ,a ,b ,c)) (iota 9 1)))
                    => (^r (return r)))
                   ((prime-count-over?
                      8 (map (^x `(,x ,x ,a ,x ,b ,c)) (iota 9 1)))
                    => (^r (return r)))
                   ((prime-count-over?
                      8 (map (^x `(,x ,x ,a ,b ,x ,c)) (iota 9 1)))
                    => (^r (return r)))
                   ((prime-count-over?
                      8 (map (^x `(,x ,a ,x ,x ,b ,c)) (iota 9 1)))
                    => (^r (return r)))
                   ((prime-count-over?
                      8 (map (^x `(,x ,a ,x ,b ,x ,c)) (iota 9 1)))
                    => (^r (return r)))
                   ((prime-count-over?
                      8 (map (^x `(,x ,a ,b ,x ,x ,c)) (iota 9 1)))
                    => (^r (return r)))
                   ((prime-count-over?
                      8 (map (^x `(,a ,x ,x ,x ,b ,c)) (iota 10)))
                    => (^r (return r)))
                   ((prime-count-over?
                      8 (map (^x `(,a ,x ,x ,b ,x ,c)) (iota 10)))
                    => (^r (return r)))
                   ((prime-count-over?
                      8 (map (^x `(,a ,x ,b ,x ,x ,c)) (iota 10)))
                    => (^r (return r)))
                   ((prime-count-over?
                      8 (map (^x `(,a ,b ,x ,x ,x ,c)) (iota 10)))
                    => (^r (return r))))))))))