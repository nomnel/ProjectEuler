;; Gauche 0.9.3

; 小数部の循環 <=> 余りの循環 なので同じ余りが出るまで計算すればよい
; また, p / q の余りは0 ~ q-1の範囲なので, 循環節の長さは最大でq
; よって大きいnから調べ, それまでの最大値よりもnが小さくなれば計算を終了できる
(define (e26)
  (define (recurring-length n)
    (let1 v (make-vector n #f)
      (vector-set! v 1 0)
      (let loop ((p 1) (c 0))
        (if (< p n)
            (loop (* p 10) (+ c 1))
            (let1 r (remainder p n)
              (cond ((zero? r) 0)
                    ((vector-ref v r) (- c (vector-ref v r)))
                    (else (vector-set! v r c)
                          (loop (* r 10) (+ c 1)))))))))

  (let loop ((n 999) (ans '(0 0)))
    (if (< n (cadr ans))
        (car ans)
        (loop (- n 1) (let1 len (recurring-length n)
                        (if (< len (cadr ans))
                            ans
                            `(,n ,len)))))))