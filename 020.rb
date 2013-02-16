def e020
  def factorial(n)
    n.downto(1).inject(:*)
  end

  factorial(100).to_s.split("").map{|s| s.to_i}.inject(:+)
end