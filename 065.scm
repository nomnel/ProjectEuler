;; Gauche 0.9.3

(add-load-path "." :relative)
(use eulerlib)
(use gauche.sequence)

(define (e65)
  (let1 val (+ 2 (/ 1 (fold-right
                        (^(n p) (if (zero? p) n (+ n (/ 1 p))))
                        0
                        (map-with-index
                          (^(i v) (if (= 1 (modulo i 3))
                                      (* 2 (+ (quotient i 3) 1)) v))
                          (iota 99 1 0)))))
    ($ apply +
     $ integer->list
     $ string->number
     $ car $ string-split (number->string val) "/")))