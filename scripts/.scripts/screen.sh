#!/bin/sh

killall polybar -q

INTERNAL=$(xrandr | grep "connected" | grep "eDP" | cut -d" " -f1)
EXTERNAL=$(xrandr | grep "connected" | grep -v "eDP" | head -n 1 | cut -d" " -f1)

if [ -n "$EXTERNAL" ]; then
    xrandr --output "$INTERNAL" --mode 1920x1080 --pos 0x0 --rotate normal \
           --output "$EXTERNAL" --primary --mode 2560x1080 --pos 1920x0 --rotate normal
else
    xrandr --output "$INTERNAL" --auto --primary
fi

feh --bg-fill ~/Pictures/wallpapers/wave.png --bg-fill ~/Pictures/wallpapers/wave.png

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload main &
  done
else
  polybar --reload main &
fi
