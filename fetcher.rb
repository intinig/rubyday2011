#!/usr/bin/env ruby

require 'nokogiri'
require 'open-uri'

doc = Nokogiri::HTML(open('http://lists.ruby-it.org/pipermail/ml/'))

doc.css('td a').each do |link| 
  puts 'http://lists.ruby-it.org/pipermail/ml/' + link['href'] if link['href'] =~ /\.gz/
end
