def e001
  (1..999).select{|i| (i % 3).zero? || (i % 5).zero?} \
          .inject(:+)
end