#!/bin/sh

# Comando per mostrare uno slider per la retroilluminazione
yad --scale --min-value=0 --max-value=100 --step=1 --value=$(cat /sys/class/backlight/intel_backlight/brightness) --orient=horizontal --title="Backlight Control" --text="Adjust the backlight" | while read -r value; do
  echo $value | sudo tee /sys/class/backlight/intel_backlight/brightness
done

