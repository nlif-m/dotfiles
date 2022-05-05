if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -gx LC_ALL en_US.UTF-8
set -gx LANG en_US.UTF-8
set -gx LANGUAGE en_US.UTF-8
set -gx GPG_TTY (tty)

# Default programs:
set -gx EDITOR "vim"
set -gx TERMINAL "st"
set -gx BROWSER "firefox"

#set -gx fish_greeting ""
set -gx fish_greeting ""
# ~/ Clean-up:
set -gx XDG_CONFIG_HOME "$HOME/.config"
set -gx XDG_DATA_HOME "$HOME/.local/share"
set -gx XDG_CACHE_HOME "$HOME/.cache"
set -gx XINITRC "$XDG_CONFIG_HOME/x11/xinitrc"
#set -gx XAUTHORITY "$XDG_RUNTIME_DIR/Xauthority" # This line will break some DMs.
set -gx NOTMUCH_CONFIG "$XDG_CONFIG_HOME/notmuch-config"
set -gx GTK2_RC_FILES "$XDG_CONFIG_HOME/gtk-2.0/gtkrc-2.0"
set -gx LESSHISTFILE "-"
set -gx WGETRC "$XDG_CONFIG_HOME/wget/wgetrc"
set -gx INPUTRC "$XDG_CONFIG_HOME/shell/inputrc"
set -gx ZDOTDIR "$XDG_CONFIG_HOME/zsh"
#set -gx ALSA_CONFIG_PATH "$XDG_CONFIG_HOME/alsa/asoundrc"
#set -gx GNUPGHOME "$XDG_DATA_HOME/gnupg"
set -gx WINEPREFIX "$XDG_DATA_HOME/wineprefixes/default"
set -gx KODI_DATA "$XDG_DATA_HOME/kodi"
set -gx PASSWORD_STORE_DIR "$XDG_DATA_HOME/password-store"
set -gx TMUX_TMPDIR "$XDG_RUNTIME_DIR"
set -gx CARGO_HOME "$XDG_DATA_HOME/cargo"
set -gx GOPATH "$HOME/golang"
set -gx ANSIBLE_CONFIG "$XDG_CONFIG_HOME/ansible/ansible.cfg"
set -gx UNISON "$XDG_DATA_HOME/unison"
set -gx HISTFILE "$XDG_DATA_HOME/history"

fish_add_path "$HOME/.local/bin" "$CARGO_HOME/bin" "$GOPATH/bin"

umask u=rwx,g=rx,o-rwx
# Informative Git prompt configuration:
set -g __fish_git_prompt_show_informative_status 1
set -g __fish_git_prompt_hide_untrackedfiles 1

set -g __fish_git_prompt_color_branch magenta 
set -g __fish_git_prompt_showupstream "informative"
set -g __fish_git_prompt_char_upstream_ahead "↑"
set -g __fish_git_prompt_char_upstream_behind "↓"
set -g __fish_git_prompt_char_upstream_prefix ""

set -g __fish_git_prompt_char_stagedstate "●"
set -g __fish_git_prompt_char_dirtystate "✚"
set -g __fish_git_prompt_char_untrackedfiles "…"
set -g __fish_git_prompt_char_conflictedstate "✖"
set -g __fish_git_prompt_char_cleanstate "✔"

set -g __fish_git_prompt_color_dirtystate blue
set -g __fish_git_prompt_color_stagedstate yellow
set -g __fish_git_prompt_color_invalidstate red
set -g __fish_git_prompt_color_untrackedfiles $fish_color_normal
set -g __fish_git_prompt_color_cleanstate green 

set z_provider /usr/bin/zoxide
if test -e $z_provider
    begin
        $z_provider init fish | source  
    end
else
    echo "WARNING: z provider not found, $z_provider not exists"
end
