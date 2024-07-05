#!/usr/bin/env bash

## Files and cmd
FILE="$HOME/.cache/ewwbar.xyz"
EWW="eww"
BAR="$HOME/.config/eww/bar"

## Run eww daemon if not running already
if [[ ! $(pidof eww) ]]; then
  ${EWW} daemon
  sleep 1
fi

## Open widgets
run_eww() {
  ${EWW} -c ${BAR} open bar
}

## Launch or close widgets accordingly
if [[ ! -f "$FILE" ]]; then
  touch "$FILE"
  #sh ${BAR}/scripts/quotes update
  #sh ${BAR}/scripts/getweather --getdata
  run_eww
else
  ${EWW} -c ${BAR} close-all
  rm "$FILE"
fi
