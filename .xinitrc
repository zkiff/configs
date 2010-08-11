#!/bin/bash

xrdb -merge $HOME/.Xdefaults
xsetbg $HOME/pictures/wallpapers/wp.jpg

xsetroot -cursor_name left_ptr


trayer --edge top --align right --SetDockType true --SetPartialStrut true --transparent true --alpha 0 --tint 0x3D3D3D --width 10 --height 17 &

setxkbmap de -variant nodeadkeys

wicd-client &

pidgin &

exec xmonad



 





