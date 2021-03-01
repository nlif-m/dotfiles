session=${1:-dwm}

case $session in
    xfce|xfce4 ) exec startxfce4;;
    dwm        ) slstatus & 
                 exec dwm ;;
    i3|i3wm    ) exec i3;;
    # No known session, try to run it as command
    *          ) exec $1;;
esac


