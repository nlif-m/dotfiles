#!/bin/fish
sh -c "setxkbmap -layout us,ru -option 'grp:ctrl_shift_toggle' -option 'grp:caps_toggle'"

#if [ -f "${XDG_CONFIG_HOME:-$HOME/.config}/x11/xprofile" ]; then
#   . "${XDG_CONFIG_HOME:-$HOME/.config}/x11/xprofile"
#else
	#. "$HOME/.xprofile"
#fi


set wm $argv[1]


function startup_i3 
    sh -c "exec ssh-agent i3"
end
    
function startup_dwm
    sh -c "exec dwm"
end

function startup_xfce4 
    exec startxfce4
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
    case '*'
	startup_i3

end


