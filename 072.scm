;; Gauche 0.9.3

(add-load-path "." :relative)
(use eulerlib)

; Like a sieve of Eratosthenes.
(define (e72)
  (let* ((L (+ 1000000 1))
         (phi (list->vector (iota L))))
    (dolist (i (range 2 L))
      (when (= i (vector-ref phi i))
        (dolist (j (range i L i))
          (vector-set! phi j (* (vector-ref phi j) (/ (- i 1) i))))))
    (apply + (vector->list phi))))