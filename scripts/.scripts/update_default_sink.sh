#!/bin/bash

# get the name of the active sink and defines as pattern
SINK=$(pactl list short sinks | grep "RUNNING" | awk '{print $1}' | head -n 1)

pactl set-default-sink "$SINK"
