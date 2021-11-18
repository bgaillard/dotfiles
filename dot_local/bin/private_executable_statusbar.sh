#!/bin/bash

function battery() {
    local empty_icon="\uf244"
    local full_icon="\uf240"
    local half_icon="\uf242"
    local capacity
    local icon

    capacity=$(cat /sys/class/power_supply/BAT0/capacity)

    if [ "${capacity}" -gt 80 ] ; then
        icon="${full_icon}"
    elif [ "${capacity}" -lt 20 ] ; then
        icon="${empty_icon}"
    else
        icon="${half_icon}"
    fi

    echo -e "${icon}  ${capacity}%"
}

function volume() {
    local off_icon="\uf026"
    local low_icon="\uf027"
    local high_icon="\uf028"
    local icon="${low_icon}"
    local front_left
    local master
    local on_off

    master=$(amixer sget Master)

    front_left=$(echo "${master}"| grep 'Front Left:' | sed 's/.*\[\(.*\)%\].*/\1/g')
    on_off=$(echo "${master}" | grep 'Front Left:' | sed 's/.*\[.*\%] \[\(.*\)\].*/\1/g')

    if [ "${on_off}" == "off" ] ; then
        icon="${off_icon}"
    elif [ "${front_left}" -gt 80 ] ; then
        icon="${high_icon}"
    fi

    echo -e "${icon} ${front_left}%"
}

function wifi_essid() {
    iwgetid | sed 's/.*ESSID:"\(.*\)"/\1/g'
}

while true; do
    xsetroot -name " $(wifi_essid) | $(volume) | $(battery) | $(date --rfc-3339=seconds)"
    sleep 1
done
