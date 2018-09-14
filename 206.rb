s = '1_2_3_4_5_6_7_8_9_0'
min = Math.sqrt(s.gsub('_', '0').to_i).ceil
max = Math.sqrt(s.gsub('_', '9').to_i).floor
reg = /1.2.3.4.5.6.7.8.9.0/
i = min / 10 * 10
while i <= max
  break i if !!(i**2).to_s.match(reg)
  i += 10
end
