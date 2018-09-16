require 'prime'

max = 100_000_000
prime_map = {}.tap {|h|
  Prime.each(max + 1) do |p|
    h[p] = true
  end
}

(1..max).select {|n|
  (1..(n**0.5).floor).all? {|d| n % d != 0 || prime_map[d + n / d] }
}.sum
