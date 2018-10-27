def c(n, i)
  ((n - i + 1)..n).inject(:*) / (1..i).inject(:*)
end

puts (7 * (1 - (c(60, 20) / c(70, 20).to_f))).to_s.split('').take(11).join
