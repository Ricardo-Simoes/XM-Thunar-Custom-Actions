#!/bin/bash
 
# Title   : Thunar Custom Action to resize a picture
# Author  : Cesare Riva
# Version : 1.0
# Date    : 17-03-2016   
 
DEST="./resized"
WIDTH=140
HEIGHT=210 
QUALITY=100
 
 
# check required software
CHECK=("convert" "zenity")
for i in "${CHECK[@]}"
do
  if ! command -v $i >/dev/null 2>&1 ; then
      echo "Error: '$i' not found (install the appropriate package)" 1>&2
      exit 1
  fi
done
 
resize=$(zenity --width=$WIDTH --height=$HEIGHT --list \
  --text "Resize picture(s) to" --radiolist  --column "px" --column "width x height"\
  FALSE 250x250 FALSE 500x500 TRUE 800x600 FALSE 1024x768 FALSE 1080x720 FALSE 1920x1080 FALSE 2048x1357);
 
# check if "Cancel" button
if ! [[ $resize ]];
then
  exit 1
fi
 
mkdir -p $DEST
 
for file
    do
    if [ ! -e $file ]
        then
        continue
    fi
    to_name="$DEST/"$(echo $file | cut -f1 -d.)".jpg"
    convert -resize $resize -quality $QUALITY "${file}" "${to_name}"
done
 
exit 0
