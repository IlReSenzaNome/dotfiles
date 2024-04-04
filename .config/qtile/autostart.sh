#!/bin/sh

# Select wallpaper
feh --bg-scale ~/.config/qtile/Wallpapers/wallpaper.jpg
setxkbmap -option caps:escape
# Add this script to your wm startup file.

DIR="$HOME/.config/polybar/"

# Terminate already running bar instances
killall -q polybar
killall mpd 
killall picom
killall dunst
killall daemon

while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch the bar
polybar -q power -c "$DIR"/config.ini &
polybar -q clock -c "$DIR"/config.ini &
polybar -q spotify -c "$DIR"/config.ini &
polybar -q workspaces -c "$DIR"/config.ini &
polybar -q sound -c "$DIR"/config.ini & 
polybar -q settings -c "$DIR"/config.ini &
polybar -q wifi -c "$DIR"/config.ini &
# Play Reproductor
mpd &
# Shadows
picom &
# notifications
dunst &
# widgets
daemon & 


