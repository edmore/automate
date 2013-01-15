#! /usr/bin/env ruby
# Usage : git mv old new folder ["(exclusion|list|of|repos)"]
#  e.g. : git mv README README.md ~/Sites "(redis|hadoop)"

from = ARGV[0]
to = ARGV[1]
dir = File.expand_path( ARGV[2] )
exclude = ARGV[3] || "absolutelynothing"

Dir.foreach(dir) do |repo|
  next unless (File.directory?(dir + "/" + repo) and repo !~ /(^\.)/)
  if(File.exist?("#{dir}/#{repo}/#{from}") and repo !~ /#{exclude}/)
    cmd = []
    Dir.chdir( "#{dir}/#{repo}" )
    cmd << "git mv #{from} #{to}"
    cmd << "git add #{to}"
    cmd << "git commit -m \"Renamed #{from} to #{to}\""
    cmd << "git_deploy #{repo} #{dir}"
    system cmd.join("&")
    puts "File #{from} in repo [#{repo}] renamed to #{to}."
    Dir.chdir( "#{dir}" )
  end
end
