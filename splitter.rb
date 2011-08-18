#!/usr/bin/env ruby

Dir.glob('archives/*.txt').each do |f|
  year, month = f.split('/')[1].split('.')[0].split('-')
  system "perl -ne 'if(/^From /){open F,\">eml/msg-#{year}-#{month}-\".++$m.\".eml\"}print F' #{f}"
end