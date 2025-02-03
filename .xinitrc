#!/bin/sh

# start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

xrdb ~/.Xresources
xmodamp ~/.Xmodmap

# Disable screen blanking (standby mode)
# https://wiki.archlinux.org/title/Display_Power_Management_Signaling#DPMS_interaction_in_a_Linux_console_with_setterm
# https://bbs.archlinux.org/viewtopic.php?id=173157
sleep 1; xset s off

exec i3
