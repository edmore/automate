#! /usr/bin/ruby

##########################################################
# Description - Create symbolic links for scripts
# Author - www.edmoremoyo.com
##########################################################

folder = ARGV[0]
link_directory = "/usr/local/bin/"
file_extension = ARGV[1] || "rb"

Dir.foreach(folder) do |file|
  file_without_extension = file.partition(".")[0]
  unless ( File.exist?(link_directory + file_without_extension) )
    if (file.partition(".")[2] == file_extension)
      system("sudo ln -s #{folder}/#{file} #{link_directory + file_without_extension}")
      puts "Created symbolic link for #{file}."
    end
  end
end

puts "Linkified!!!"
