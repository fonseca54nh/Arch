#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

if type "xrandr" > /dev/null; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload left -c ~/.config/polybar/config &
    MONITOR=$m polybar --reload center -c ~/.config/polybar/config &
    MONITOR=$m polybar --reload right -c ~/.config/polybar/config &
    MONITOR=$m polybar --reload bottom -c ~/.config/polybar/config &
  done
else
  polybar --reload left -c ~/.config/polybar/config &
  polybar --reload center -c ~/.config/polybar/config &
  polybar --reload right -c ~/.config/polybar/config &
  polybar --reload bottom -c ~/.config/polybar/config &
fi

echo "Bars launched..."
