#!/bin/bash

MEM=$(free -m | grep '^Mem' | awk '{print $3"MB"}')
UPTIME=$(uptime | awk '{print $3}' | tr -d ',')
DATETIME=$(date +"%c")

TEXT=$(amixer get Master | tail -1)
VOLLVL=$(echo $TEXT | cut -d' ' -f5 | sed 's/\(\[\|%\|\]\)// g')
VOLSTATE=$(echo $TEXT | cut -d' ' -f6 | sed 's/\(\[\|\]\)// g')

case "$VOLSTATE" in
    "on"    ) VOLSTATE="V:";;
    "off"   ) VOLSTATE="Vx";;
esac
VOLSTATE=$VOLSTATE$(printf %3s $VOLLVL)

xsetroot -name "$VOLSTATE | M:$MEM | $DATETIME"

