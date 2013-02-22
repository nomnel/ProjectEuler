require "prime"

def e021
  def sum_of_proper_divisors(n)
    return 1 if n == 1

    Prime.prime_division(n).map{|pd|
      # pd[0]: base, pd[1]: exponent
      (0..pd[1]).inject(0){|mem, var| mem += pd[0] ** var}
    }.inject(:*) - n
  end

  def amicable_number?(n)
    m = sum_of_proper_divisors(n)
    n != m && n == sum_of_proper_divisors(m)
  end

  (2..10000).select{|n| amicable_number?(n)}.inject(:+)
end