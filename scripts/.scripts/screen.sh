#!/bin/sh
killall polybar -q

xrandr --output eDP-1 --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI-1-1 --primary --mode 2560x1080 --pos 1920x0 --rotate normal

 feh --bg-fill ~/Pictures/wallpapers/lofi-computer.png --bg-fill ~/Pictures/wallpapers/lofi-computer.png

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload main &
  done
else
  polybar --reload main &
fi
