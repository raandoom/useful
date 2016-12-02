#!/bin/bash

DUNSTIFY="/home/raandoom/.dwm/dunst/dunstify"

ID_PATH="/home/raandoom/.dwm/scripts/.dunst_volume"

if [ "$1" == "down" ]
then
    TEXT=$(amixer set Master 2%- unmute | tail -1)
elif [ "$1" == "up" ]
then
    TEXT=$(amixer set Master 2%+ unmute | tail -1)
elif [ "$1" == "mute" ]
then
    TEXT=$(amixer set Master toggle | tail -1)
else
    echo "Usage volume [up | down | mute]"
    exit
fi

LVL=$(echo $TEXT | cut -d' ' -f5 | sed 's/\(\[\|%\|\]\)// g')
STATE=$(echo $TEXT | cut -d' ' -f6 | sed 's/\(\[\|\]\)// g')

ID=$(cat $ID_PATH)
if [ $ID -gt "0" ]
then
    REPLACE="-r $ID"
fi

$DUNSTIFY $REPLACE -p \
    -a "<b>VOLUME</b>" $STATE \
    -h int:value:$LVL \
    > $ID_PATH
