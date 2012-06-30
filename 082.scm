;; Gauche 0.9.3

(add-load-path "." :relative)
(use eulerlib)

(define (e82)
  (let* ((len 80)
	 (V (* len len))
	 (d (dijkstra))
	 (cl (apply append
		    (read-file "./matrix.txt"
			       (^l (map string->number (string-split l ",")))))))
    
    (let loop ((idx 1) (cl cl))
      (unless (null? cl)
	; entry point
	(when (= 1 (modulo idx len))
	  ((d 'edge-push!) 0 idx (car cl)))
	; right
	(unless (= 1 (modulo idx len))
	  ((d 'edge-push!) (- idx 1) idx (car cl)))
	; down
	(when (< len idx)
	  ((d 'edge-push!) (- idx len) idx (car cl)))
	; up
	(when (<= idx (- V len))
	  ((d 'edge-push!) (+ idx len) idx (car cl)))
	(loop (+ idx 1) (cdr cl))))
    (floor->exact ((d 'search) (range len (+ V 1) len) V))))