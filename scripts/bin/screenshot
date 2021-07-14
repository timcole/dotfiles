#!/bin/bash
MAIN_FOLDER="$HOME/Pictures/Screenshots"
SERVER_NAME="poggers"
BUCKET_NAME="cdn"
NAME=$(openssl rand -base64 8 | tr -dc '[:alnum:]\n\r')

# Make folder
mkdir -p ${MAIN_FOLDER}/

# Take Screenshot
screencapture -x -s -C -m ${MAIN_FOLDER}/${NAME}.png

if [ ! -e ${MAIN_FOLDER}/${NAME}.png ]; then exit 0; fi

# Send Uploading Notification
# osascript -e 'display notification "'"$NAME"'" with title "Uploading Screenshot"'

# Upload
mc cp ${MAIN_FOLDER}/${NAME}.png ${SERVER_NAME}/${BUCKET_NAME}/${NAME}.png

# File URL
FILE_URL="https://t.pics/${NAME}.png"

# Copy URL to clipboard
echo $FILE_URL | pbcopy 

# Send Upload Notification
osascript -e 'display notification "'"$FILE_URL"'" with title "Uploaded Screenshot"'
