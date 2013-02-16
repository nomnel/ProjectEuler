def e004
  def palindrome?(n)
    n.to_s == n.to_s.reverse
  end

	(100..999).collect {|i|
		(100..999).collect {|j|
			p = i * j
			palindrome?(p) ? p : 0
    }.max}.max
end