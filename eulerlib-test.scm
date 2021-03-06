(use gauche.test)
(test-start "eulerlib module")

(add-load-path "." :relative)
(use eulerlib)
(test-module 'eulerlib)

(test* "(range 1 4)"    '(1 2 3)  (range 1 4))
(test* "(range 10 1 3)" '(10 7 4) (range 10 1 3))

(test* "(primes 10)" '(2 3 5 7)  (primes 10))

(test* "(integer->list 123)"  '(1 2 3)  (integer->list 123))
(test* "(integer->list -123)" '(1 2 3)  (integer->list 123))

(test* "(list->integer '(12 3 45))" 12345 (list->integer '(12 3 45)))

(test* "(palindrome? 123)" #f (palindrome? 123))
(test* "(palindrome? 121)" #t (palindrome? 121))

(test* "(factorize 20 '(2 3 5 7))" '((2 2) (5 1))  (factorize 20 '(2 3 5 7)))

(test* "(triangular 2) " 3 ((polygonal-formula 3) 2))
(test* "(pentagonal 2) " 5 ((polygonal-formula 5) 2))

(test* "(sum-proper-divisors 12 '(2 3 5 7))" 16 (sum-proper-divisors 12 '(2 3 5 7)))

(test* "(prime? 93)" #f (prime? 93))
(test* "(prime? 97)" #t (prime? 97))

(test* "((memorize prime? with :ht-type :true-list" #f ((memorize prime? :type 'eq? :true-list '(2 3 5 7)) 9))
(test* "((memorize prime? with :ht-type :true-list" #t ((memorize prime? :type 'eq? :true-list '(2 3 5 7)) 7))

(test* "(pandigital? 135792468)"  #t (pandigital? 135792468))
(test* "(pandigital? 1357924689)" #f (pandigital? 1357924689))
(test* "(pandigital? 1324 4)" #t (pandigital? 1324 4))

(test* "((is? '(1 2 3 4)) 4)" #t ((is? '(1 2 3 4)) 4))

(test* "(prime-factors 24 '(2 3 5 7))" '(3 2) (prime-factors 24 '(2 3 5 7)))

(test* "(continued-fraction 7)" '(2 (1 1 1 4)) (continued-fraction 7))

(test* "(extract-sqrt 2 10)" '(1 4 1 4 2 1 3 5 6 2) (extract-sqrt 2 10))

(test* "(real->list 123.456789)" '((1 2 3) (4 5 6 7 8 9)) (real->list 123.456789))

(test-end)