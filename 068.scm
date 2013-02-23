;; Gauche 0.9.3

(add-load-path "." :relative)
(use eulerlib)
(use util.combinations)

(define (e68)
  (define (line outer inner)
    `(,(car outer) ,(car inner) ,(cadr inner)))
  (define (16digit outer inner)
    (let loop ((o outer) (i (append inner `(,(car inner)))) (r '()))
      (if (null? o)
          (list->integer (apply append (reverse r)))
          (loop (cdr o) (cdr i) (cons (line o i) r)))))
  (let1 res '()
    (permutations-for-each
      (^l (let1 outer `(6 ,(car l) ,(cadr l) ,(caddr l) ,(cadddr l))
            (permutations-for-each
              (^(inner) (let1 s (apply + (line outer inner))
                          (let loop ((o (cdr outer))
                                     (i (append (cdr inner) `(,(car inner)))))
                            (cond ((null? o)
                                   (set! res (cons (16digit outer inner) res)))
                                  ((= s (apply + (line o i)))
                                   (loop (cdr o) (cdr i)))))))
              (iota 5 1))))
      (iota 4 7))
    (apply max res)))