;; Gauche 0.9.3

(use gauche.sequence)

(define (e22)
  (define (score s)
    (apply + (map (^c (- (char->integer c) 64))
                  (string->list s))))
  (apply + (map-with-index (^(i s) (* (+ 1 i) (score s)))
                           (sort (map (^s (substring s 1 (- (string-length s) 1)))
                                      (string-split (call-with-input-file "./names.txt" read-line) ","))
                                 string<?))))