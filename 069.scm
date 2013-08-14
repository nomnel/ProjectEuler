(add-load-path "." :relative)
(use eulerlib)

; n/φ(n) = 1/(1-1/p1)*(1-1/p2)* ...
; と展開できる. (ここでp1, p2, ... はnの素因数)
; よって1000000を超えない範囲で2*3*5*...と素数を乗じたものが答えになる
(define (e69)
  (let loop ((ps (primes 100)) (x 1))
    (let1 y (* x (car ps))
      (if (< 1000000 y)
          x
          (loop (cdr ps) y)))))