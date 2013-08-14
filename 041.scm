(add-load-path "." :relative)
(use eulerlib)
(use util.combinations)

; 各桁の和が3の倍数になる数は3の倍数なので
; (apply + (iota 4 1)) = 10
; (apply + (iota 5 1)) = 15
; (apply + (iota 6 1)) = 21
; (apply + (iota 7 1)) = 28
; (apply + (iota 8 1)) = 36
; (apply + (iota 9 1)) = 45
; より, 7桁と4桁のときのみを調べればよい
(define (e41)
  (define (seek digit)
    (let1 l (reverse (sort (map list->integer
                                (permutations (iota digit 1)))))
      (let loop ((l l))
        (cond ((null? l) #f)
              ((prime? (car l)) (car l))
              (else (loop (cdr l)))))))
  (or (seek 7) (seek 4)))