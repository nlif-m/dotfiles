setxkbmap -layout us,ru -option 'grp:ctrl_shift_toggle'

if [ -f "${XDG_CONFIG_HOME:-$HOME/.config}/x11/xprofile" ]; then
	. "${XDG_CONFIG_HOME:-$HOME/.config}/x11/xprofile"
else
	. "$HOME/.xprofile"
fi


session=${1:-dwm}
case $session in
    xfce|xfce4 ) exec startxfce4;;
    dwm        ) slstatus & 
                 exec dwm ;;
    i3|i3wm    ) exec i3;;
    plasma|kde ) exec startplasma-x11;;
    xmonad     ) exec dbus-launch --exit-with-session xmonad;;
    # No known session, try to run it as command
    *          ) exec $1;;
esac


