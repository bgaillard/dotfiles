#!/bin/bash

ACTION=${1:-down}
ICON=audio-volume-medium.png

# Perform the volume action
if [ "${ACTION}" == "down" ] ; then
    amixer -q sset Master 1%-
elif [ "${ACTION}" == "up" ] ; then
    amixer -q sset Master 1%+
elif [ "${ACTION}" == "mute" ] ; then
    amixer -q -D pulse sset Master toggle
else
    echo "Invalid action!"
fi

# Update the status bar
statusbar.sh

# Display a notification of the change
DUNST_NOTIFICATION_ID=1001
MASTER=$(amixer sget Master)
FRONT_LEFT=$(echo "${MASTER}"| grep 'Front Left:' | sed 's/.*\[\(.*\)%\].*/\1/g')
ON_OFF=$(echo "${MASTER}" | grep 'Front Left:' | sed 's/.*\[.*\%] \[\(.*\)\].*/\1/g')
TITLE="Volume ${FRONT_LEFT} %"

if [ "${ON_OFF}" == "off" ] ; then
    ICON=audio-volume-muted.png
    TITLE="Volume muted."
elif [ "${FRONT_LEFT}" -gt 80 ] ; then
    ICON=audio-volume-high.png
elif [ "${FRONT_LEFT}" -lt 20 ] ; then
    ICON=audio-volume-low.png
fi

dunstify --replace="${DUNST_NOTIFICATION_ID}" \
    --icon="/usr/share/icons/gnome/32x32/status/${ICON}" \
    "${TITLE}"
