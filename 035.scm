;; Gauche 0.9.3

(add-load-path "." :relative)
(use eulerlib)

; 各桁に偶数と5を含まないような素数のみ確認する
; (2, 5も巡回素数なので後で足しておく)
(define (e35)
  (define (rotate l) (append (cdr l) `(,(car l))))
  (let ((ps (primes 1000000))
        (ht (make-hash-table)))
    (dolist (p ps) (hash-table-put! ht p #t))
    (+ 2 ; 2, 5
       (length (filter
                 (^p (let1 l (integer->list p)
                       (and (not (any (^n (or (= 5 n) (even? n))) l))
                            (let loop ((l (rotate l))
                                       (c (- (length l) 1)))
                              (cond ((zero? c) #t)
                                    ((hash-table-get ht (list->integer l) #f)
                                     (loop (rotate l) (- c 1)))
                                    (else #f))))))
                 ps)))))