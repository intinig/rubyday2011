#!/usr/bin/env ruby

require 'redis'

REDIS = Redis.new

people = REDIS.scard("senders:", 0, 9)

people.each do |person|
  (2005..2011).each do |year|
    count = REDIS.zscore("senders:#{year}", person)
    puts "#{person} - #{year} - #{count}"
  end
end