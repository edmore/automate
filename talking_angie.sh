#! /bin/bash

###############################################################
# Description - Playback script for my daughter
#             - stops recording after certain period of silence
# Author - www.edmoremoyo.com
###############################################################

rec test.mp3 silence 1 0.3 1% 1 0.3 1% > /dev/null
play test.mp3 > /dev/null
rm -f test.mp3
