#!/bin/bash
MAIN_FOLDER="$HOME/Pictures/Screenshots"
BUCKET_NAME="cdn.tcole.me"
NAME=$(openssl rand -base64 8 | tr -dc '[:alnum:]\n\r')
GSUTIL_PATH="/usr/local/bin/gsutil"

# Make folder
mkdir -p ${MAIN_FOLDER}/

# Take Screenshot
screencapture -x -s -C -m ${MAIN_FOLDER}/${NAME}.png

if [ ! -e ${MAIN_FOLDER}/${NAME}.png ]; then exit 0; fi

# Send Uploading Notification
# osascript -e 'display notification "'"$NAME"'" with title "Uploading Screenshot"'

# Upload
$GSUTIL_PATH cp ${MAIN_FOLDER}/${NAME}.png gs://${BUCKET_NAME}/${NAME}.png

# File URL
FILE_URL="https://t.pics/${NAME}.png"

# Copy URL to clipboard
echo $FILE_URL | pbcopy 

# Send Upload Notification
osascript -e 'display notification "'"$FILE_URL"'" with title "Uploaded Screenshot"'
