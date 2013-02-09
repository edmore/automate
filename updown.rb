#! /usr/bin/env ruby

##########################################################
# Description - Check whether site is up or down via the
#                command line.
# Author - www.edmoremoyo.com
# Dependency - phantomjs ( http://phantomjs.org/ )
##########################################################

js_file = File.new("updown.js", "w+")
url = ARGV[0]

js = <<HERE
var page = require('webpage').create();
page.open('http://www.isup.me/#{url}', function () {
        var response = page.evaluate(function () {
                return document.getElementById("container").innerHTML;
            });

        var up_or_down = /looks down from here/.exec(response);
        (up_or_down !== null) ? console.log("#{url} is down dude! It ain't just you.") : console.log("#{url} is up! Just you dude :-(");
        phantom.exit();
    });
HERE

js_file.puts js
js_file.close

system("phantomjs updown.js")
system("rm -f updown.js > /dev/null")