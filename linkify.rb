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
  unless ( File.exist?("/usr/local/bin/" + file_without_extension) )
    system("sudo ln -s #{folder}/#{file} /usr/local/bin/#{file_without_extension}") if file.match(/#{file_extension}/)
  end
end

