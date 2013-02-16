def e019
  def leap_year?(year)
    ((year % 400).zero?) || ((year % 4).zero? && (not ((year % 100).zero?)))
  end

  def month_days(year)
    [31, leap_year?(year) ? 29 : 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
  end

  # day: 0=>sunday, 1=>monday, ...
  # 初期値は1901/01/01 が何曜日か
  day = (1 + month_days(1900).inject(:+)) % 7
  count = day.zero? ? 1 : 0

  (1901..2000).map{|year| month_days(year)} \
              .each{|year_months|
                year_months.each{|month_days|
                  day = (day + month_days) % 7
                  count += 1 if day.zero?}}

  count
end