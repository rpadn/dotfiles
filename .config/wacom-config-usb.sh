#!/bin/sh
# Taken from
# https://wiki.archlinux.org/title/Graphics_tablet#Through_xsetwacom_via_udev_and_systemd_service

for i in $(seq 10); do
    if xsetwacom list devices | grep -q Wacom; then
        break
    fi
    sleep 1
done

list=$(xsetwacom list devices)
stylus=$(echo "${list}" | awk '/stylus/{print $10}')
eraser=$(echo "${list}" | awk '/eraser/{print $10}')

if [ -z "${stylus}" ]; then
    exit 0
fi

# Only main monitor
xsetwacom set "${stylus}" MapToOutput DP-1
xsetwacom set "${eraser}" MapToOutput DP-1

# Higher threshold for drag (aka easier double click)
xsetwacom set "${stylus}" PanScrollThreshold 2000
xsetwacom set "${eraser}" PanScrollThreshold 2000

xsetwacom set "${stylus}" PressureCurve 5 0 100 95
xsetwacom set "${eraser}" PressureCurve 5 0 100 95

# NOTE: wacom one standard pen has built-in eraser functionality as second
# button, which means **it cannot be remapped yet**
# https://github.com/linuxwacom/xf86-input-wacom/issues/134
# xsetwacom set "${stylus}" Button 3 undo
