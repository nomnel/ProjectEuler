;; Gauche 0.9.3

(add-load-path "." :relative)
(use eulerlib)
(use gauche.sequence)

; 最長は2以降の素数を100万を超えないように順番に足していったときの長さなので
; そこから素数が見つかるまで長さを縮めていく
(define (e50)
  (let* ((ps (primes 5000))
         (v (make-vector (+ (length ps) 1) 0)))
    (for-each-with-index
      (^(i p) (vector-set! v (+ i 1) (+ p (vector-ref v i))))
      ps)
    (let1 max-len (let loop ((i 0))
                    (if (< 1000000 (vector-ref v (+ i 1)))
                        i (loop (+ i 1))))
      (call/cc (^(return)
                  (dolist (l (range max-len 0))
                    (call/cc (^(break)
                                (dolist (i (iota (- (+ max-len 1) l) 1))
                                  (let1 s (- (vector-ref v (+ i l))
                                             (vector-ref v i))
                                    (cond ((< 1000000 s) (break))
                                          ((prime? s) (return s)))))))))))))