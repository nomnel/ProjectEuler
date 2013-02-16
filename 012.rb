require "prime"

def e012
  def divisor_count(n)
    Prime.prime_division(n).map{|a| a[1] + 1}.inject(:*)
  end

  triangle_number = Enumerator.new {|y|
    val, delta = 1, 2
    loop {
      y << val += delta
      delta += 1
    }
  }

  triangle_number.find{|n| divisor_count(n) > 500}
end