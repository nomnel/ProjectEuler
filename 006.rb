def e006
  (1..100).inject(:+)**2 - (1..100).map{|i| i**2}.inject(:+)
end

def e006_answer
  25164150
end