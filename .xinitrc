#!/bin/sh

WALLPAPER='~/Pictures/Wallpapers/1514121481144.jpg'
## Copied from default xinit
userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi
if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi
if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi
if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start system essentials

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

## User defined
xcompmgr -D 2 -o 0 -fFc & # I can't remember what these options do...

# Themes the entire pc + sets wallpaper
walall $WALLPAPER &

## Disable mouse accel (Logitech G502)
# libinput Accel Profile Enabled
xinput --set-prop 8 288 0, 1 
# libinput Accel Speed
xinput --set-prop 8 285 0 
# Legacy support
xset m 1 0 &

# Sets the background of polybar
POLYBAR_BACK='${colors.background}'
exec i3
