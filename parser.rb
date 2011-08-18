#!/usr/bin/env ruby
Encoding.default_external = Encoding.find("ISO-8859-1")

require 'mail'
require 'redis'

REDIS = Redis.new

def random_color
  r = 64 + rand(191)
  g = 64 + rand(191)
  b = 64 + rand(191)
  
  "#{r.to_s(16)}#{g.to_s(16)}#{b.to_s(16)}".upcase
end

# File.open "custom.log", "w" do |log|
#   Dir.glob("eml/*.eml").each do |f|
#     mail = File.read f
#     mail.gsub!(/From(:)?(.*) a (.*)/, 'From\1\2@\3')
#     File.open(f, "w") {|f| f.puts mail}
#     mail = Mail.read f
#     sender = mail['from'].to_s.match(/\((.*)\)/)[1]
#     clean_subject = mail.subject.gsub("|", "-").gsub("/", "-")
#     clean_body = mail.body.decoded.strip.gsub("|", "-").gsub("/", "-").gsub("\n", ". ")[0,40].encode('UTF-8', :invalid => :replace, :undef => :replace)
#     begin
#       log.puts "#{mail.date.to_time.to_i}|#{sender}|A|#{clean_subject}/#{clean_body}...|#{random_color}"
#     rescue
#       puts clean_subject.encoding.inspect
#       puts clean_subject
#       puts clean_body.encoding.inspect
#       puts clean_body
#       puts
#       puts
#       puts
#     end
#   end
# end

Dir.glob("eml/*.eml").each do |f|
  mail = Mail.read f
  sender = mail['from'].to_s.match(/\((.*)\)/)[1]
  year = f.split("-")[1]
  month = f.split("-")[2]
  # REDIS.zincrby("senders:all", 1, "#{mail.envelope_from}")
  # REDIS.zincrby("senders:#{year}", 1, "#{mail.envelope_from}")
  # REDIS.zincrby("senders:#{year}:#{month}", 1, "#{mail.envelope_from}")
  sender = mail['from'].to_s.match(/\((.*)\)/)[1].downcase
  REDIS.sadd("sender:#{mail.envelope_from.downcase}:name", sender)
  REDIS.sadd("sender:#{sender}:email", mail.envelope_from)
  REDIS.sadd("senders:emails", mail.envelope_from)
  REDIS.sadd("senders:names", sender)
end
