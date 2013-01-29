#!/usr/bin/env ruby -i
# http://blog.nicksieger.com/articles/2007/10/06/obscure-and-ugly-perlisms-in-ruby/

Header = DATA.read

ARGF.each_line do |e|
  puts Header if ARGF.lineno == 1
  puts e
end

__END__
#--
# Copyright (C) 2013 Edmore Moyo.
#++