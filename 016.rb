def e016
  (2**1000).to_s.split("").map(&:to_i).inject(:+)
end

def e016_answer
  1366
end