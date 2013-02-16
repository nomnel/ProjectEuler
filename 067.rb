def e067
	ary = File.open("triangle.txt").read \
	          .split(/\n/).map{|s| s.split(" ").map{|t| t.to_i}}

	ary = ary.reverse

	ary.each_index{|i|
		if not i.zero?
			ary[i].each_index{|j|
				ary[i][j] += [ary[i - 1][j], ary[i - 1][j + 1]].max
			}
		end
	}

	ary.reverse[0][0]
end