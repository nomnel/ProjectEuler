def e024
  (0..9).to_a.permutation.to_a[1000000 - 1].inject{|mem, var| mem * 10 + var}
end

def e024_answer
  2783915460
end