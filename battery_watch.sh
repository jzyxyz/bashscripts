#!/bin/bash

# Check if the battery is connected
if [ -e /sys/class/power_supply/BAT0 ]; then

  # this line is for debugging mostly. Could be removed
  #notify-send --icon=info "STARTED MONITORING BATERY"
  zenity --warning --text "STARTED MONITORING BATERY"

  while true; do
    # Get the capacity
    CAPACITY=$(cat /sys/class/power_supply/BAT0/uevent | grep -i capacity | cut -d'=' -f2)

    case $CAPACITY in
    # do stuff when we hit 11 % mark
    8 | [0-9])
      # send warning and suspend only if battery is discharging
      # i.e., no charger connected
      STATUS=$(cat /sys/class/power_supply/BAT0/uevent | grep -i status | cut -d'=' -f2)
      if [ $(echo $STATUS) == "Not charging" ]; then

        #notify-send --urgency=critical --icon=dialog-warning "LOW BATTERY! SUSPENDING IN 30 sec"
        zenity --warning --text "LOW BATTERY"
        # sleep 30
        # gnome-screensaver-command -l && sudo pm-suspend
        break
      fi
      ;;
    *)
      sleep 1
      continue
      ;;
    esac
  done
fi
