(define (e20)
  (apply + (map digit->integer
                ($ string->list
                 $ number->string
                 $ apply * (iota 100 1)))))
