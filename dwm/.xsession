while true
do
    /home/raandoom/.dwm/scripts/xsetroot.sh
    sleep 1s
done &

setxkbmap -rules evdev -model pc105 -layout us,ru -option -option "grp:shift_caps_toggle" &

# We prepend /usr/share/gnome since its defaults.list actually points 
# to /etc so it is configurable.
if [ -z "$XDG_DATA_DIRS" ]; then
    XDG_DATA_DIRS=/usr/share/gnome:/usr/local/share/:/usr/share/
else
    XDG_DATA_DIRS=/usr/share/gnome:"$XDG_DATA_DIRS"
fi
export XDG_DATA_DIRS

/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 &
nm-applet &
xbattbar -a -c -i#005577 -o#222222 &

feh --bg-fill /home/raandoom/Pictures/wall.jpg &
exec /home/raandoom/.dwm/dwm/dwm
