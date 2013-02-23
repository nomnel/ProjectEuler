;; Gauche 0.9.3

(add-load-path "." :relative)
(use eulerlib)
(use srfi-1)

; 最頻値がスペースだとした
(define (e59)
  (define (divide l)
    (let loop ((l l) (c 1) (l1 '()) (l2 '()) (l3 '()))
      (cond ((null? l) (list l1 l2 l3))
            ((= c 1) (loop (cdr l) 2 (cons (car l) l1) l2 l3))
            ((= c 2) (loop (cdr l) 3 l1 (cons (car l) l2) l3))
            ((= c 3) (loop (cdr l) 1 l1 l2 (cons (car l) l3))))))
  (define (most-frequent l)
    (car
      (fold (^(n p) (if (or (null? p) (< (cadr p) (cadr n)))
                        `(,(car n) ,(cadr n))
                        p))
            '()
            (fold (^(n p) (cond ((null? p) `((,n 1)))
                                ((= n (caar p))
                                 (cons `(,n ,(+ 1 (cadar p))) (cdr p)))
                                (else (cons `(,n 1) p))))
                  '()
                  (sort l)))))

  (let* ((cipher (map string->number
                      (string-split (call-with-input-file "./cipher1.txt" read-line) ",")))
         (key (map (^i (+ i (char->integer #\space)))
                   (map most-frequent (divide cipher)))))
    (apply + (map (^(i j) (logxor i j))
                  cipher
                  (circular-list (car key) (cadr key) (caddr key))))))