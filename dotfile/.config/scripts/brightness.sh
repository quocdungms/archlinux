#!/usr/bin/env bash

# You can call this script like this:
# $ ./brightnessControl.sh up
# $ ./brightnessControl.sh down

# Script inspired by these wonderful people:
# https://github.com/dastorm/volume-notification-dunst/blob/master/volume.sh
# https://gist.github.com/sebastiencs/5d7227f388d93374cebdf72e783fbd6a


# REQUIRED light-git package from aur
function get_brightness {
  xbacklight -get | cut -d '.' -f 1
}

function send_notification {
  icon="/usr/share/icons/Faba/48x48/notifications/notification-display-brightness.svg"
  brightness=$(get_brightness)
  # Make the bar with the special character ─ (it's not dash -)
  # https://en.wikipedia.org/wiki/Box-drawing_character
  bar=$(seq -s "─" 0 $((brightness / 5)) | sed 's/[0-9]//g')
  # Send the notification
  dunstify -i "$icon" -r 5555 -u normal "    $bar"
}

case $1 in
  up)
    # increase the backlight by 5%
    light -A 5
    send_notification
    ;;
  down)
    # decrease the backlight by 5%
    light -U 5
    send_notification
    ;;
esac
