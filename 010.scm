(use srfi-1)
(use math.prime)

(define (e10)
  (apply + (take-while (cut < <> 2000000) *primes*)))
