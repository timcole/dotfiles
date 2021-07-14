#!/bin/bash
MAIN_FOLDER="$HOME/Pictures/Screenshots"
NAME=$(openssl rand -base64 8 | tr -dc '[:alnum:]\n\r')

# Make folder(s)
mkdir -p ${MAIN_FOLDER}/

# Take Screenshot
screencapture -x -s -C -m ${MAIN_FOLDER}/${NAME}.png

# Send Uploading Notification
# osascript -e 'display notification "'"$NAME"'" with title "Uploading Screenshot"'

# Upload Screenshot
FILE_URL=$(curl -F "file=@${MAIN_FOLDER}/${NAME}.png" https://i.nuuls.com/upload -s)

# Copy URL to clipboard
echo $FILE_URL | pbcopy 

# Send Upload Notification
osascript -e 'display notification "'"$FILE_URL"'" with title "Uploaded Screenshot"'
