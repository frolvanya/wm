#!/bin/sh

if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
    /run/current-system/sw/bin/sketchybar --set $NAME \
        background.drawing=on \
        label.color=0xff3b4252
else
    /run/current-system/sw/bin/sketchybar --set $NAME \
        background.drawing=off \
        label.color=0xffe5e9f0
fi
