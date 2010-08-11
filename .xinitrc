#!/bin/bash
#

# .xinitrc


xrandr -s 0


xrdb -merge $HOME/.Xdefaults


xsetroot -cursor_name left_ptr
xsetroot -solid '#80a0af'
# xsetbg -zoom 88 $HOME/pics/wp/1226415526592.jpg 

trayer --edge top --align right --SetDockType true --SetPartialStrut true --expand true --transparent true --alpha 0 --tint 0x3D3D3D --width 10 --height 17 &



xset fp+ /usr/share/fonts/local/terminus
xset fp+ /usr/share/fonts/TTF/
xset b 100 0 0
xset r rate 300 100
xsetbg ~/pics/wp.jpg

# xmodmap $HOME/.Xmodmap

setxkbmap de -variant nodeadkeys

pidgin &

dropboxd &

exec xmonad
