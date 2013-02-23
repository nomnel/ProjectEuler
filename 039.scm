;; Gauche 0.9.3

(add-load-path "." :relative)
(use eulerlib)

; 直角三角形の各辺の長さをa, b, cとする(c: 斜辺)と,
; a^2 + b^2 = c^2 と
; a + b + c = p より
; p(p - 2a) = 2b(p - a) が成り立つので
; aは, mod p(p - 2a) 2(p - a) = 0 を満たす
(define (e39)
  (define (solutions p)
    (let1 res 0
      (for-each (^a (when (zero? (modulo (* p (- p (* 2 a)))
                                         (* 2 (- p a))))
                          (inc! res)))
                (iota (- (quotient p 3) 1) 1))
      res))
  (cadr (fold (^(n p) (let1 s (solutions n)
                        (if (< (car p) s)
                            `(,s ,n) p)))
              '(0 0)
              (range 4 1001 2))))