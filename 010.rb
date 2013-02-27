require "prime"

def e010
  Prime.each(2000000).inject(:+)
end