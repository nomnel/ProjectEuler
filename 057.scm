;; Gauche 0.9.3

(add-load-path "." :relative)
(use eulerlib)

(define (e57)
  (define (continued-fraction n a0 a1 iter)
    (let loop ((c 2) (res `(,a1)))
      (if (< n c)
          (map (cut + a0 <>) (reverse res))
          (loop (+ c 1) (cons (iter (car res)) res)))))
  (define (exceed? r)
    ((^l (> (string-length (car l)) (string-length (cadr l))))
     (string-split (number->string r) "/")))

  (let loop ((c 0) (l (continued-fraction 1000 1 1/2 (^(prev) (/ 1 (+ 2 prev))))))
    (if (null? l) c
        (loop (if (exceed? (car l)) (+ c 1) c) (cdr l)))))