#!/bin/dash

if [ "$#" -ne 6 ];
then
    echo "Usage: notify.sh APP_NAME REPLACE_ID ICON_NAME HEAD_TEXT BODY_TEXT TOUT_MSEC"
    exit 
fi

APP_NAME="$1"
REPLACE_ID="$2"
ICON_NAME="$3"
HEAD_TEXT="$4"
BODY_TEXT="$5"
TOUT_MSEC="$6"

gdbus call --session \
    --dest org.freedesktop.Notifications \
    --object-path /org/freedesktop/Notifications \
    --method org.freedesktop.Notifications.Notify \
    "${APP_NAME}" \
    "${REPLACE_ID}" \
    "${ICON_NAME}" \
    "${HEAD_TEXT}" \
    "${BODY_TEXT}" \
    [] \
    {} \
    "${TOUT_MSEC}" | \
    egrep -o 'uint32 ([0-9]{1,})' | egrep -o '[^ ]+$'
