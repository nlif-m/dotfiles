#!/bin/fish
sh -c "setxkbmap -layout us,ru -option 'grp:ctrl_shift_toggle' -option 'grp:caps_toggle'"

#if [ -f "${XDG_CONFIG_HOME:-$HOME/.config}/x11/xprofile" ]; then
#   . "${XDG_CONFIG_HOME:-$HOME/.config}/x11/xprofile"
#else
	#. "$HOME/.xprofile"
#fi


if set -q $argv[1]
    set wm $argv[1]
else
    set wm i3
end

function startup_i3 
    sh -c "exec ssh-agent i3"
end
    
function startup_dwm
    sh -c "exec dwm"
end

switch $wm
    case i3 i3wm
	startup_i3
    case dwm
	startup_dwm
    case '*'
	startup_i3

end


