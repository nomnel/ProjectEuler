def e017
	# 0 ~ 19
	ary = ["", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"]

	# 20 ~ 99
	["twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"] \
	.each{|d10| (0..9).each{|d1| ary.push(d10 + ary[d1])}}

	# 100 ~ 999
	(1..9).each{|d100| (0..99).each{|d11|
		ary.push(ary[d100] + "hundred" + (d11.zero? ? "" : "and") + ary[d11])}}

	# 1000
	ary.push("onethousand")

	ary.map(&:length).inject(:+)
end