#!/bin/bash

if [[ "$DESKTOP_SESSION" == "Openbox" ]]; then
  openbox --exit
elif [[ "$DESKTOP_SESSION" == "bspwm" ]]; then
  bspc quit
elif [[ "$DESKTOP_SESSION" == "i3" ]]; then
  i3-msg exit
elif [[ "$DESKTOP_SESSION" == "qtile" ]]; then
  qtile cmd-obj -o cmd -f shutdown
fi
