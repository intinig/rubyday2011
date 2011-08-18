#!/usr/bin/env ruby

require 'mail'


Dir.glob("eml/msg-2010-*.eml").each do |f|
  year = f.split("-")[1]
  month = f.split("-")[2]
   
  mail = Mail.read f
  clean_body = mail.body.decoded.downcase.
    encode('UTF-8', :invalid => :replace, :undef => :replace, :replace => '')
  
  File.open("bodies/#{year}", "a") do |f|
    f.puts clean_body
  end

  File.open("bodies/#{year}-#{month}", "a") do |f|
    f.puts clean_body
  end
end