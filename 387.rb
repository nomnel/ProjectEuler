require 'prime'

@primes = Prime.each((10**14)**0.5).to_a; nil
def prime?(n)
  Prime.prime?(n, @primes)
end

def rec(base, e, flag, result)
  (0..9).sum do |i|
    n = base * 10 + i
    if prime?(n)
      flag ? n : 0
    else
      div, mod = n.divmod(n.to_s.split('').sum(&:to_i))
      next 0 unless mod == 0
      if e > 0
        rec(n, e - 1, prime?(div), result)
      else
        result
      end
    end
  end
end

(1..9).sum {|i| rec(i, 12, false, 0) }
