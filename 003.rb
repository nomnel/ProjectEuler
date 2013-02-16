require "prime"

def e003
  Prime.prime_division(600851475143).map{|a| a[0]}.max
end