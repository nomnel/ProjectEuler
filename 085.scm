;; Gauche 0.9.3

(add-load-path "." :relative)
(use eulerlib)

; rectangles-count = triangle-number(n) * triangle-number(m)
(define (e85)
  (let* ((c 2000000)
	 (triangle (polygonal-formula 3))
	 (n/triangles (map (^n `(,n ,(triangle n)))
			   (iota (+ (sqrt (* 2 c)) 1) 1)))
	 (area/rectangles (append-map (^m (map (^n `(,(* (car m) (car n))
						     ,(* (cadr m) (cadr n))))
					       n/triangles))
				      n/triangles)))
    (car (fold (^(n p) (if (< (abs (- (cadr n) c)) (abs (- (cadr p) c)))
			   n p))
	       '(0 0)
	       area/rectangles))))