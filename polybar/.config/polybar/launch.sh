#!/usr/bin/env bash

DIR="$HOME/.config/polybar/"

# Terminate already running bar instances
killall -q polybar
killall -q polybar

# Wait until the processes have been shut down
while 
    pgrep -u $UID -x polybar >/dev/null; 
do 
    sleep 1; 
done

# Launch the bars
polybar -q top -c "$DIR"/config.ini &
polybar -q bottom -c "$DIR"/config.ini &
































































