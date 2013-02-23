def e025
  fib = Enumerator.new {|y|
    a, b = 0, 1
    loop {
      y << b
      a, b = b, a + b
    }
  }

  sup = 10**999
  fib.enum_for(:each_with_index) \
     .take_while{|val, idx| val < sup} \
     .last[1] + 2
end