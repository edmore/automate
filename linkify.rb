#! /usr/bin/env ruby

##########################################################
# Description - Create symbolic links for scripts
# Author - www.edmoremoyo.com
##########################################################

if ARGV[0] == "-h"
usage = <<HERE
   Usage :  ./linkify.rb folder [extension|link_directory]
      e.g ./linkify.rb ~/automate "sh" "/usr/bin"
      extension and link_directory are optional.
HERE
puts usage
exit
end

folder = File.expand_path( ARGV[0] )
link_directory = ARGV[2] || "/usr/local/bin/"
file_extension = ARGV[1] || "rb"

Dir.foreach(folder) do |file|
  next if file =~ /(README|^\.|DS_Store|\~$)/
  name_extension = /(\S+)[.](\S+)/.match(file)
  unless ( File.exist?(link_directory + name_extension[1]) )
    if (name_extension[2] == file_extension)
      system("sudo ln -s #{folder}/#{file} #{link_directory + name_extension[1]}")
      puts "Created symbolic link for #{file}."
    end
  end
end

puts "Linkified!!!"
