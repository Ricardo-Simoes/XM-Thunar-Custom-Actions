#!/bin/bash
 
# Title   : Thunar Custom Action to resize a picture
# Author  : Cesare Riva
# Version : 1.0
# Date    : 17-03-2016   
 
DEST="./resized"
WIDTH=140
HEIGHT=350
QUALITY=100
LEFT=-90
RIGHT=90
 
# check required software
CHECK=("convert" "zenity")
for i in "${CHECK[@]}"
do
  if ! command -v $i >/dev/null 2>&1 ; then
      echo "Error: '$i' not found (install the appropriate package)" 1>&2
      exit 1
  fi
done
 

rotate=$(zenity --width=$WIDTH --height=$HEIGHT --list \
  --text "Choose rotate direction" --radiolist  --column "Sel" --column "Direction"\
 FALSE left  TRUE right);
 
#rotate=$(zenity --width=$WIDTH --height=$HEIGHT --scale \
#  --text "pick num" --min-value=-90 --max-value=90 --value=90 --step 90);

 
# check if "Cancel" button
if ! [[ $rotate ]];
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
    convert -rotate $rotate -quality $QUALITY "${file}" "${to_name}"
done
 
exit 0
