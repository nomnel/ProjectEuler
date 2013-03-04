require "prime"

def e010
  Prime.each(2000000).inject(:+)
end

def e010_answer
  142913828922
end