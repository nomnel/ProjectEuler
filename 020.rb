def e020
  def factorial(n)
    n.downto(1).inject(:*)
  end

  factorial(100).to_s.split("").map(&:to_i).inject(:+)
end

def e020_answer
  648
end