#!/bin/bash

# Title: Thunar Custom Action to resize a picture
# Author: Cesare Riva
# Version: 1.0
# Date: 17-03-2016

# Destination directory for resized images
DEST="./resized"

# Default dimensions for the resize dialog
WIDTH=140
HEIGHT=530

# Quality of the resized images
QUALITY=100

# Check for required software dependencies
CHECK=("convert" "zenity")
for i in "${CHECK[@]}"
do
  if ! command -v $i >/dev/null 2>&1 ; then
      echo "Error: '$i' not found. Please install ImageMagick and Zenity." 1>&2
      exit 1
  fi
done

# Present a dialog to the user to select the resize dimensions
resize=$(zenity --width=$WIDTH --height=$HEIGHT --list \
  --text "Resize picture(s) to" --radiolist  --column "px" --column "width x height"\
  FALSE 250x250 FALSE 256x256 FALSE 500x500 TRUE 800x600 FALSE 1024x768 FALSE 1080x720 FALSE 1920x1080 FALSE 2048x1357);

# Check if the user canceled the operation
if ! [[ $resize ]];
then
  exit 1
fi

# Create the destination directory if it doesn't exist
mkdir -p $DEST

# Loop through each file provided as an argument
for file
do
    if [ ! -e "$file" ]; then
        continue
    fi
    # Extract the file extension
    file_extension="${file##*.}"
    # Create the destination file name with the same name and extension
    to_name="$DEST/$(basename "$file")"
    # Resize the image and save it to the destination directory
    convert -resize $resize -quality $QUALITY "$file" "$to_name"
done

exit 0
