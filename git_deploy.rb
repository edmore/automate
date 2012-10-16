#! /usr/bin/ruby

##########################################################
# Description - Git Deploy to multiple remote repositories
# Author - www.edmoremoyo.com
##########################################################

if ARGV[0] == "-h"
usage = <<HERE
   Usage :  ./git_deploy.rb repo [repo_folder]
      e.g ./git_deploy.rb .emacs.d ~
      repo_folder is optional; defaults to ~/Sites folder.
HERE
puts usage
exit
end

if ARGV.length > 2 || ARGV[0].nil?
  puts  "Sorry!!, only two arguments supported."
  exit
end

home = File.expand_path('~')
dir = ARGV[1] || "#{home}/Sites/"
repo = File.expand_path( dir ) + "/"+  ARGV[0]
begin
  Dir.chdir(repo)
rescue
  puts "WTF!! [#{ARGV[0]}] isn't a repo in the #{dir} directory ..."
end

if File.exist?(".git/config")
  puts "Running Git pull on #{ARGV[0]} ..."
  system("git pull")

  File.open(".git/config", "r") do |file|
    while (line = file.gets)
      next unless line =~ /\[remote/
      remote = /"(.*?)"/.match(line)[0]
      puts "Deploying #{ARGV[0]} to #{remote} ..."
      system("git push #{remote} master")
    end
  end
  puts "Done."
else
  puts "This ain't no Git Repo!!"
end


