;; Gauche 0.9.3

(use srfi-1)           ; for take-while
(use gauche.generator) ; for generate

(define (e002b)
  (define fibs
    ; (take fibs 10) => (0 1 1 2 3 5 8 13 21 34)
    (generator->lseq
      (generate (^(yield) (let loop ((a 0) (b 1))
                            (yield a) (loop b (+ a b)))))))
  ($ apply +
   $ filter (cut even? <>)
   $ take-while (cut < <> 4000000) fibs))