(add-load-path "." :relative)
(use eulerlib)

; 連続する4数で素因数の個数が全て4となっているものを探す
(define (e47)
  (let1 ps (primes 200000)
    (let loop ((i 210) (fc '())) ; (* 2 3 5 7) = 210
      (cond ((< i 214) (loop (+ i 1)
                             (cons (length (prime-factors i ps)) fc)))
            ((every (cut = 4 <>) `(,(car fc) ,(cadr fc) ,(caddr fc) ,(cadddr fc)))
             (- i 4))
            (else (loop (+ i 1)
                        (cons (length (prime-factors i ps)) fc)))))))