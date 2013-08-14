(add-load-path "." :relative)
(use eulerlib)

(use util.combinations)

(define (e24)
  (let1 c 1
    (call/cc (^(return)
                (permutations-for-each
                  (^l (when (= c 1000000) (return (list->integer l)))
                      (inc! c))
                  (iota 10))))))