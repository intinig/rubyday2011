#!/usr/bin/env ruby

(2005..2011).each do |y|
  e = Dir.glob("eml/msg-#{y}*").count
  puts "#{y} - #{e}"
end