setxkbmap -layout us,ru -option 'grp:ctrl_shift_toggle'

if [ -f "${XDG_CONFIG_HOME:-$HOME/.config}/x11/xprofile" ]; then
	. "${XDG_CONFIG_HOME:-$HOME/.config}/x11/xprofile"
else
	. "$HOME/.xprofile"
fi


default_wm=i3

startup_dmw(){
    slstatus & 
    redshift &
    emacs --daemon &
    exec ssh-agent dwm 
}
startup_i3 () {
    redshift &
    exec ssh-agent i3
}
    

session=${1:-$default_wm}
case $session in
    xfce|xfce4 ) exec startxfce4;;
    dwm        ) startup_dmw;;
    i3|i3wm    ) startup_i3;;
    plasma|kde ) exec startplasma-x11;;
    xmonad     ) exec dbus-launch --exit-with-session xmonad;;
    awesome    ) exec awesome;;
    # No known session, try to run it as command
    *          ) exec $1;;
esac


