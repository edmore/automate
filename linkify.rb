#! /usr/bin/env ruby

##########################################################
# Description - Create symbolic links for scripts
# Author - www.edmoremoyo.com
##########################################################

if ARGV[0] == "-h"
usage = <<HERE
   Usage :  ./linkify.rb source_directory [extension] [target_directory]
      e.g ./linkify.rb ~/automate "sh" "/usr/bin"
      extension and target are optional.
HERE
puts usage
exit
end

source_directory = File.expand_path( ARGV[0] )
target_directory = ARGV[2] || "/usr/local/bin/"
file_extension = ARGV[1] || "rb"

Dir.foreach(source_directory) do |file|
  next if file =~ /(README|^\.|DS_Store|\~$)/
  name_extension = /(\S+)[.](\S+)/.match(file)
  unless ( File.exist?(target_directory + name_extension[1]) )
    if (name_extension[2] == file_extension)
      system("sudo ln -s #{source_directory}/#{file} #{target_directory + name_extension[1]}")
      puts "Created symbolic link for #{file}."
    end
  end
end

puts "Linkified (or not) !!!"
