#!/bin/bash

LOCATION_JSON=$(curl -s "https://ipinfo.io/json")
CITY=$(echo "$LOCATION_JSON" | jq -r '.city')
COUNTRY=$(echo "$LOCATION_JSON" | jq -r '.country')

if [ -z "$CITY" ]; then
  CITY="Unknown Location"
fi

LANG="en"
WEATHER_JSON=$(curl -s "https://wttr.in/$CITY?format=j1&lang=$LANG")

if [ -z "$WEATHER_JSON" ]; then
  /run/current-system/sw/bin/sketchybar --set "$NAME" label="Error: No data"
  exit 1
fi

TEMPERATURE=$(echo "$WEATHER_JSON" | jq -r '.current_condition[0].temp_C')
WEATHER_DESCRIPTION=$(echo "$WEATHER_JSON" | jq -r '.current_condition[0].weatherDesc[0].value')

if [ -z "$TEMPERATURE" ] || [ -z "$WEATHER_DESCRIPTION" ]; then
  /run/current-system/sw/bin/sketchybar --set "$NAME" label="Error: Missing data"
  exit 1
fi

/run/current-system/sw/bin/sketchybar --set "$NAME" \
  label="${TEMPERATURE}°C • ${WEATHER_DESCRIPTION}"
