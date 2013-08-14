(add-load-path "." :relative)
(use eulerlib)

; http://en.wikipedia.org/wiki/Pentagonal_number_theorem
(define (e78)
  (define generalised_pentagonal
    (let1 pentagonal (polygonal-formula 5)
      (^n (if (< n 0) 0
              (pentagonal ((if (zero? (modulo n 2)) + -) (+ (quotient n 2) 1)))))))

  (let* ((L 100000)
         (pt (make-vector (+ L 1) 0)))
    (vector-set! pt 0 1)
    (call/cc
      (^(return)
         (dolist (n (iota L 1))
           (let loop ((r 0) (f -1) (i 0))
             (let1 k (generalised_pentagonal i)
               (if (> k n)
                   (if (zero? (modulo r 1000000))
                       (return n)
                       (vector-set! pt n r))
                   (let1 f ((if (zero? (modulo i 2)) - +) f)
                     (loop (+ r (* f (vector-ref pt (- n k))))
                           f (+ i 1)))))))))))