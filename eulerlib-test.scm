(use gauche.test)
(test-start "eulerlib modulo")

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

(test* "((memorize prime? with :ht-type :true-list" #f ((memorize prime? :ht-type 'eq? :true-list '(2 3 5 7)) 9))
(test* "((memorize prime? with :ht-type :true-list" #t ((memorize prime? :ht-type 'eq? :true-list '(2 3 5 7)) 7))

(test-end)