;; Gauche 0.9.3

(add-load-path "." :relative)
(use eulerlib)
(use srfi-1)

; f(n) = n^2 + an + b とすると
; f(0) = b, f(1) = a + b + 1
; ∴ b: 素数, a + b + 1: 素数 と考えて良い
; また, b = 2 のときを考えると
; f(2) = 2^2 + 2a + 2 となり,
; これは明らかに2以上の偶数なので, bは3以上の素数と考えて良い
; またこのとき, aは奇数となる
(define (e27)
  (let* ((ps (primes 1000))
         (p? (memorize prime? :true-list ps)))
    ((^l (* (car l) (cadr l)))
     (fold (^(n p) (if (> (caddr n) (caddr p)) n p))
           '(0 0 0)
           (append-map
             (^a (map (^b `(,a ,b ,(length
                                     (take-while
                                       (^n (let1 y (+ (* n n) (* a n) b)
                                                 (and (positive? y) (p? y))))
                                       (iota b)))))
                      ps))
             (iota 1000 -999 2))))))