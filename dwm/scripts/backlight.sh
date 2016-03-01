#!/bin/bash

DUNSTIFY="/home/raandoom/.dwm/dunst/dunstify"

ID_PATH="/home/raandoom/.dwm/scripts/.dunst_backlight"

MAX_PATH="/sys/class/backlight/acpi_video0/max_brightness"
CUR_PATH="/sys/class/backlight/acpi_video0/actual_brightness"

if [ ! -e $MAX_PATH ] || [ ! -e $CUR_PATH ]
then
    exit
fi

BR_CNT=$(cat $MAX_PATH)
BR_CUR=$(cat $CUR_PATH)
BR_STP=$((100 / $BR_CNT + 1))

if [ "$1" == "down" ]
then
    ACT="-"
    if [ "$BR_CUR" -gt "0" ]
    then
        BR_CUR=$(($BR_CUR - 1))
    fi
elif [ "$1" == "up" ]
then
    ACT="+"
    if [ "$BR_CUR" -lt "$BR_CNT" ]
    then
        BR_CUR=$(($BR_CUR + 1))
    fi
else
    echo "Usage brightness [up | down]\n"
    exit
fi

BR_CUR=$(($BR_CUR * $BR_STP))
if [ $BR_CUR -gt "100" ]
then
    BR_CUR=100
fi

xbacklight -time 0 -set $BR_CUR

ID=$(cat $ID_PATH)
if [ $ID -gt "0" ]
then
    REPLACE="-r $ID"
fi

$DUNSTIFY $REPLACE -p \
    -a "<b>BACKLIGHT</b>" $ACT \
    -h int:value:$BR_CUR \
    > $ID_PATH
