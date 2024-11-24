#!/bin/sh

if [ "$SENDER" = "front_app_switched" ]; then
  /run/current-system/sw/bin/sketchybar --set "$NAME" label="$INFO"
fi
