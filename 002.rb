def e002
  fib = Enumerator.new {|y|
    a, b = 1, 1
    loop {
      y << b
      a, b = b, a + b
    }
  }

  fib.take_while{|n| n < 4000000}.select(&:even?).inject(:+)
end