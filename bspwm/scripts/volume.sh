#!/bin/bash

NOTIFY="$BSPWM_SCRIPTS_PATH/notify.sh"
ID_PATH="$BSPWM_SCRIPTS_PATH/.id_volume"

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
    echo "Usage: volume [up | down | mute]"
    exit
fi

LVL=$(echo $TEXT | cut -d' ' -f5 | sed 's/\(\[\|%\|\]\)// g')
STATE=$(echo $TEXT | cut -d' ' -f6 | sed 's/\(\[\|\]\)// g')

if [ ! -f "$ID_PATH" ]
then
    ID=0
else
    ID=$(cat $ID_PATH)
fi

$NOTIFY "" "$ID" "" "VOLUME" "$STATE $LVL" 3000 > $ID_PATH

echo "V$STATE $LVL" > "$PANEL_FIFO"
