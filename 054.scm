(add-load-path "." :relative)
(use eulerlib)
(use util.match)
(use gauche.sequence)

(define (e54)
  ; カードの枚数が多い順, 大きい順に (大きさ 枚数) のリストを返す
  ; (count '((5 "H") (5 "C") (6 "S") (5 "S") (13 "D"))) -> ((5 3) (13 1) (6 1))
  (define (count hands)
    (sort (fold (^(n p) (cond ((null? p) `((,n 1)))
                              ((= n (caar p))
                               (cons `(,n ,(+ (cadar p) 1)) (cdr p)))
                              (else (cons `(,n 1) p))))
                '()
                (sort (map (cut car <>) hands)))
          (^(a b) (or (> (cadr a) (cadr b))
                      (> (car a) (car b))))))

  (define (straight? c)
    (every = (map car c) (iota 5 (caar c) -1)))

  (define (flush? hands)
    (let1 suit (cadar hands)
      (every (^l (string=? suit (cadr l))) (cdr hands))))

  ; (役の得点 (役を構成する中で最も大きいカード 役以外のカード降順)) を返す
  ; 役の得点は high card = 0, one pair = 1, ... , straight flush = 8 とする
  (define (culc hands)
    (let1 c (count hands)
      (case (length c) ; 数字の種類数で場合分け
        ((2) (case (cadar c)
               ((3) `(6 (,(apply max (map car c)))))  ; full house
               ((4) `(7 ,(map car c)))))              ; four of a kind
        ((3) (case (cadar c)
               ((2) `(2 (,(caar c) ,(car (last c))))) ; two pairs
               ((3) `(3 ,(map car c)))))              ; three of a kind
        ((4) `(1 ,(map car c)))                       ; one pair
        ((5) (cond ((straight? c)
                    `(,(if (flush? hands) 8 4) (,(caar c)))) ; straight flush | straight
                   ((flush? hands) `(5 ,(map car c)))        ; flush
                   (else `(0 ,(map car c))))))))             ; high card

  (define (win? hands1 hands2)
    (let ((r1 (culc hands1)) (r2 (culc hands2)))
      (cond ((> (car r1) (car r2)) #t)
            ((< (car r1) (car r2)) #f)
            (else ; 役が同じだった場合
              (call/cc (^r (for-each (^(v1 v2) (cond ((> v1 v2) (r #t))
                                                     ((< v1 v2) (r #f))))
                                     (cadr r1) (cadr r2))))))))

  (apply + (map
             (^l (if (win? (subseq l 0 5) (subseq l 5 10)) 1 0))
             (read-file "./poker.txt"
                        (^l (map (^s `(,(match (substring s 0 1)
                                               ("A" 14) ("K" 13) ("Q" 12) ("J" 11) ("T" 10) (r (string->number r)))
                                         ,(substring s 1 2)))
                                 (string-split l " ")))))))