def e016
	(2**1000).to_s.split("").map{|s| s.to_i}.inject(:+)
end