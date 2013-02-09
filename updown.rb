#! /usr/bin/env ruby

##########################################################
# Description - Check whether site is up or down via the
#                command line.
# Author - www.edmoremoyo.com
# Dependencies - phantomjs ( http://phantomjs.org/ )
##########################################################

system("rm -f updown.js > /dev/null")

html_file = File.new("updown.js", "w+")
url = ARGV[0]

html = <<HERE
var page = require('webpage').create();
page.open('http://www.isup.me/#{url}', function () {
        var response = page.evaluate(function () {
                var down = /looks down to me/;
                return document.getElementById("container").innerHTML
            });

        var up_or_down = /looks down from here/.exec(response);
        (up_or_down !== null) ? console.log("Its down dude!") : console.log("Yep its up!");

        phantom.exit();
    });
HERE

html_file.puts html
html_file.close

system("phantomjs updown.js")
system("rm -f updown.js > /dev/null")