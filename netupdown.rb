#! /usr/bin/env ruby

##########################################################
# Description - Check whether site is up or down via the
#                command line.
# Author - www.edmoremoyo.com
##########################################################

require "net/http"
require "uri"

uri = URI.parse("http://www.isup.me/#{ARGV[0]}")
response = Net::HTTP.get_response(uri)

if (response.code == '200')
  data = Net::HTTP.get(uri)
  is_match = /is up/.match(data)

  if (is_match)
    puts "#{ARGV[0]} is UP! Jus you."
  else
    puts "#{ARGV[0]} is DOWN dude! Ain't just you."
  end
end
