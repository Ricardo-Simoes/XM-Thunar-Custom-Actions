#!/bin/bash

#recursively find and move selected pattern files from subdirs into dir 
find . -path ./.XXX -prune -o -iname "*.mp4" -exec mv {} . \;
find . -path ./.XXX -prune -o -iname "*.avi" -exec mv {} . \;
find . -path ./.XXX -prune -o -iname "*.mkv" -exec mv {} . \;
find . -path ./.XXX -prune -o -iname "*.srt" -exec mv {} . \;
