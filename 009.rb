def e009
  catch(:exit) do
    n = 1000
    (n / 2).downto(n / 3) {|c|
      (c - 1).downto((n - c) / 2) {|b|
        (b - 1).downto(1) {|a|
          if (a + b + c == n) && (a**2 + b**2 == c**2)
            throw :exit, a * b * c
          end
        }
      }
    }
  end
end