;; Gauche 0.9.3

(add-load-path "." :relative)
(use eulerlib)

(define (e4)
  (apply max
    (map (^a (apply max
               (map (^b (let1 c (* a b)
                          (if (palindrome? c) c 0)))
                    (range a 1000))))
         (range 100 1000))))