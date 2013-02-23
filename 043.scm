;; Gauche 0.9.3

(add-load-path "." :relative)
(use eulerlib)
(use srfi-1)

; 後ろからチェックしていく
(define (e43)
  (define (make-pandigital-test d)
    (^l (= d (length (delete-duplicates l)))))
  (define (add-digit l)
    (map (^d (cons d l)) (iota 10)))
  (let loop ((l (map integer->list (range 10 100)))
             (ps '(17 13 11 7 5 3 2))
             (d 3))
    (if (null? ps)
        (apply + (map list->integer (filter (make-pandigital-test d)
                                            (append-map add-digit l))))
        (let1 next (filter (make-pandigital-test d)
                           (filter (^k (zero? (modulo (list->integer (list (car k) (cadr k) (caddr k)))
                                                      (car ps))))
                                   (append-map add-digit l)))
          (loop next (cdr ps) (+ d 1))))))