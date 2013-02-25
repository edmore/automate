#! /bin/bash

#####################################################################################
# Description - Minify JS file
# Dependency - https://developers.google.com/closure/compiler/docs/gettingstarted_app
# Author - www.edmoremoyo.com
#####################################################################################

java -jar ~/compiler-latest/compiler.jar --js $1 --js_output_file $2