(use math.prime) ; mc-factorize
(use gauche.generator) ; generate

(define (e12)
  (define triangles
    (generator->lseq
      (generate (^y (let loop ((n 2) (r 1))
                      (y r) (loop (+ n 1) (+ r n)))))))
  (define (divisors-count n)
    (let1 each-factor-counts
          (cadr (fold (^(n p)
                         (if (= n (car p))
                             (list (car p) (cons (+ (caadr p) 1) (cdadr p)))
                             (list n (cons 1 (cadr p)))))
                      '(0 ())
                      (mc-factorize n)))
      (apply * (map (cut + <> 1) each-factor-counts))))
  (find (^t (< 500 (divisors-count t))) triangles))
