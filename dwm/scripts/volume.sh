DUNSTIFY="/home/raandoom/.dwm/dunst/dunstify"

if [ "$1" == "down" ]
then
    amixer -q set Master 1%- unmute
    TEXT=$(amixer sget Master | tail -1 | cut -d' ' -f7 | sed 's/\(\[\|\]\)//g')
elif [ "$1" == "up" ]
then
    amixer -q set Master 1%+ unmute
    TEXT=$(amixer sget Master | tail -1 | cut -d' ' -f7 | sed 's/\(\[\|\]\)//g')
elif [ "$1" == "mute" ]
then
    amixer -q set Master toggle
    TEXT=$(amixer sget Master | tail -1 | cut -d' ' -f8 | sed 's/\(\[\|\]\)//g')
else
    echo "Usage volume [up | down | mute]\n"
    exit
fi

ID=$(cat /home/raandoom/.dwm/scripts/.dunst_volume)
if [ $ID -gt "0" ]
then
    $DUNSTIFY -p -r $ID "Volume: $TEXT" > /home/raandoom/.dwm/scripts/.dunst_volume
else
    $DUNSTIFY -p "Volume: $TEXT" > /home/raandoom/.dwm/scripts/.dunst_volume
fi
