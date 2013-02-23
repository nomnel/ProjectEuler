;; Gauche 0.9.3

(add-load-path "." :relative)
(use eulerlib)

; 1000000 < 1*10 + 2*90 + 3*900 + 4*9000 + 5*90000 + 6*100000
; なので200000までで十分
(define (e40)
  (let loop ((c 0) (next 1) (res 1) (l (iota 200000)))
    (if (< 1000000 c)
        res
        (let* ((il (integer->list (car l)))
               (hit? (< next (+ c (length il)))))
          (loop (+ c (length il))
                (* next (if hit? 10 1))
                (* res (if hit? (list-ref il (- next c)) 1))
                (cdr l))))))