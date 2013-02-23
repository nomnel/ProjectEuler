;; Gauche 0.9.3

(add-load-path "." :relative)
(use eulerlib)

; words.txtに含まれる単語の最大長は15なので, 1000(> 15*26)以下の三角数を判定出来れば十分
(define (e42)
  (define (word-value w)
    (apply + (map (^c (- (char->integer c) 64))
                  (string->list w))))
  (define triangle?
    (is? (take-while (cut < <> 1000)
                     (map (^n ((polygonal-formula 3) n))
                          (range 1 50)))))
  (fold (^(w r) (if (triangle? (word-value w))
                    (+ r 1) r))
        0
        (map (^s (substring s 1 (- (string-length s) 1)))
             (string-split (call-with-input-file "./words.txt" read-line) ","))))