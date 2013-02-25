def e024
  (0..9).to_a.permutation.to_a[1000000 - 1].inject{|mem, var| mem * 10 + var}
end