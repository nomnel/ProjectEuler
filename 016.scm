(define (e16)
  (define (integer->list i)
    (map digit->integer (string->list (number->string i))))
  (apply + (integer->list (expt 2 1000))))