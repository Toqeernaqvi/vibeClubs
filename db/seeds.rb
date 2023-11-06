days = ['Monday', 'Tuesday', 'Wednesday','Thursday', 'Friday', 'Saturday', 'Sunday']

days.length.times do |x|
  day = WeekDay.create!(
    day: days[x])
end
