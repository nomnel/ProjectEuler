require "prime"

def e023
  def sum_of_proper_divisors(n)
    return 1 if n == 1

    Prime.prime_division(n).map{|(base, exponent)|
      (0..exponent).inject(0){|mem, var| mem += base ** var}
    }.inject(:*) - n
  end

  @memo = {}
  def abundant_number?(n)
    return @memo[n] if @memo[n] != nil

    @memo[n] = (n < sum_of_proper_divisors(n))
  end

  abundant_numbers = (1..28123).select{|n| abundant_number?(n)}

  (1..28123).select{|n|
    not(abundant_numbers.take_while{|i| i < n} \
                        .index{|m| abundant_number?(n - m)})
  }.inject(:+)
end