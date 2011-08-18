#!/usr/bin/env ruby

# MONTHS = {
#   'january' => 1, 
#   'february' => 2,
#   'march' => 3,
#   'april' => 4,
#   'may' => 5,
#   'june' => 6,
#   'july' => 7,
#   'august' => 8,
#   'september' => 9,
#   'october' => 10,
#   'november' => 11,
#   'december' => 12
# }

# files = Dir.glob('./archives/*.txt')
# files.each do |f|
#   month = f.split('-')[1].split('.')[0].downcase
#   year = f.split('-')[0]
#   dest = "#{year}-#{MONTHS[month]}.txt"
#   puts "mv #{f} #{dest}"
# end

files = Dir.glob('./eml/*.eml')
files.each do |f|
  msg, year, month, number = f.split('-')
  dest = "#{msg}-#{year}-#{month}-0#{number}" if number.to_i < 10
  puts "mv #{f} #{dest}" if number.to_i < 10
end