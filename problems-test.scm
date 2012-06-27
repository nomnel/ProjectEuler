(use gauche.test)
(add-load-path "." :relative)

(dolist (i (iota 50 1))
  (load (string-append (format #f "~3,'0d" i) ".scm")))

(test-start "problems")

(test* "001" 233168 (e1))
(test* "002" 4613732 (e2))
(test* "003" 6857 (e3))
(test* "004" 906609 (e4))
(test* "005" 232792560 (e5))
(test* "006" 25164150 (e6))
(test* "007" 104743 (e7))
(test* "008" 40824 (e8))
(test* "009" 31875000 (e9))
(test* "010" 142913828922 (e10))
(test* "011" 70600674 (e11))
(test* "012" 76576500 (e12))
(test* "013" 5537376230 (e13))
(test* "014" 837799 (e14))
(test* "015" 137846528820 (e15))
(test* "016" 1366 (e16))
(test* "017" 21124 (e17))
(test* "018" 1074 (e18))
(test* "019" 171 (e19))
(test* "020" 648 (e20))
(test* "021" 31626 (e21))
(test* "022" 871198282 (e22))
(test* "023" 4179871 (e23))
(test* "024" 2783915460 (e24))
(test* "025" 4782 (e25))
(test* "026" 983 (e26))
(test* "027" -59231 (e27))
(test* "028" 669171001 (e28))
(test* "029" 9183 (e29))
(test* "030" 443839 (e30))
(test* "031" 73682 (e31))
(test* "032" 45228 (e32))
(test* "033" 1/100 (e33))
(test* "034" 40730 (e34))
(test* "035" 55 (e35))
(test* "036" 872187 (e36))
(test* "037" 748317 (e37))
(test* "038" 932718654 (e38))
(test* "039" 840 (e39))
(test* "040" 210 (e40))
(test* "041" 7652413 (e41))
(test* "042" 162 (e42))
(test* "043" 16695334890 (e43))
(test* "044" 5482660 (e44))
(test* "045" 1533776805 (e45))
(test* "046" 5777 (e46))
(test* "047" 134043 (e47))
(test* "048" 9110846700 (e48))
(test* "049" 296962999629 (e49))
(test* "050" 997651 (e50))
(test* "051" 121313 (e51))
(test* "052" 142857 (e52))
(test* "053" 4075 (e53))
(test* "054" 376 (e54))
(test* "055" 249 (e55))
(test* "056" 972 (e56))
(test* "057" 153 (e57))
(test* "058" 26241 (e58))
(test* "059" 107359 (e59))
(test* "060" 26033 (e60))
(test* "061" 28684 (e61))
(test* "062" 127035954683 (e62))
(test* "063" 49 (e63))
(test* "064" 1322 (e64))
(test* "065" 272 (e65))
(test* "066" 661 (e66))

(test-end)