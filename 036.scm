;; Gauche 0.9.3

(add-load-path "." :relative)
(use eulerlib)

(define (e36)
  (define (both-palindrome? n)
    (and (palindrome? n)
         (palindrome? (string->number (number->string n 2)))))
  (let loop ((n 1) (s 0))
    (if (< 1000000 n) s
        (loop (+ n 1) (if (both-palindrome? n) (+ s n) s)))))