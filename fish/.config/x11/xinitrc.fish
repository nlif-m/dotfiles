#!/bin/fish
sh -c "setxkbmap -layout us,ru -option 'grp:ctrl_shift_toggle' -option 'grp:caps_toggle'"

#if [ -f "${XDG_CONFIG_HOME:-$HOME/.config}/x11/xprofile" ]; then
#   . "${XDG_CONFIG_HOME:-$HOME/.config}/x11/xprofile"
#else
	#. "$HOME/.xprofile"
#fi


set wm $argv[1]



function similar
    redshift &
    remaps &
end

function startup_i3 
    similar
    exec ssh-agent i3
end
    
function startup_dwm
    similar
    exec dwm
end

function startup_xfce4 
    similar
    exec startxfce4
end

function startup_plasma
    similar
    exec startplasma-x11
end

function startup_gnome
    similar
    exec gnome-session
end

echo $argv[1] >> $HOME/x.txt
echo $wm >> $HOME/x.txt

switch $wm
    case i3 i3wm
        startup_i3
    case dwm
        startup_dwm
    case xfce xfce4
        startup_xfce4
    case plasma kde
        startup_plasma
    case gnome
        startup_gnome
    case '*'
        startup_i3

end


