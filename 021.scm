(add-load-path "." :relative)
(use eulerlib)

(define (e21)
  (let1 ps (primes 5000)
    (apply + (filter (^a (let1 b (sum-proper-divisors a ps)
                           (and (not (= a b))
                                (= a (sum-proper-divisors b ps)))))
                     (iota 9998 2)))))