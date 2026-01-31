#!/bin/bash
# Weather module for waybar using wttr.in

# You can change this to your city, or leave empty for auto-detect
LOCATION="${WAYBAR_WEATHER_LOCATION:-}"

# Fetch weather data
weather=$(curl -sf "https://wttr.in/${LOCATION}?format=%c%t" 2>/dev/null)

if [ -n "$weather" ]; then
    tooltip=$(curl -sf "https://wttr.in/${LOCATION}?format=%l:+%C+%t+%h+%w" 2>/dev/null)
    echo "{\"text\": \"$weather\", \"tooltip\": \"$tooltip\"}"
else
    echo "{\"text\": \"󰼯\", \"tooltip\": \"Weather unavailable\"}"
fi
