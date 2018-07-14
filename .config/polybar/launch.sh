#!/bin/bash

# Kill polybar if it's running
killall -q polybar
# Wait for it to shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done


if [[ "$(hostname)" == 'Tower' ]]; then 
    polybar -r desktop1 &
    polybar -r desktop2 &
elif [[ "$(hostname)" == 'tome' ]]; then
    polybar -r laptop &
fi
