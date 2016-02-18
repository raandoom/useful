DUNSTIFY="~/.dwm/dunst/dunstify"

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
 echo "Usage volume [down | up | mute]\n"
fi

ID=$(cat /home/raandoom/.dwm/scripts/.dunst_volume)
if [ $ID -gt "0" ]
then
 $DUNSTIFY -p -r $ID "Volume: $TEXT" > ~/.dwm/scripts/.dunst_volume
else
 $DUNSTIFY -p "Volume: $TEXT" > ~/.dwm/scripts/.dunst_volume
fi
