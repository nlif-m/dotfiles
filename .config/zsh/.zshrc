# Enable colors and change prompt:
autoload -U colors && colors	# Load colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
setopt autocd		# Automatically cd into typed directory.
stty stop undef		# Disable ctrl-s to freeze terminal.
setopt interactive_comments
# History in cache directory:
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE=~/.cache/zsh/history


# Command on start
umask u=rwx,g=rx,o=rx

# Completion.
zmodload zsh/complist 
autoload -Uz compinit
compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' completer _expand_alias _complete _ignored _approximate
zstyle ':completion:*' menu select=2
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion:*:descriptions' format '%U%F{cyan}%d%f%u'
#- buggy
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'
#-/buggy

zstyle ':completion:*:pacman:*' force-list always
zstyle ':completion:*:*:pacman:*' menu yes select

zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*'   force-list always

zstyle ':completion:*:*:killall:*' menu yes select
zstyle ':completion:*:killall:*'   force-list always
_comp_options+=(globdots)		# Include hidden files.
setopt COMPLETE_ALIASES

# git support
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_

# PROMPT=\$vcs_info_msg_0_'%# '
zstyle ':vcs_info:git:*' formats '%b'

# Vi mode
bindkey -v
export KEYTIMEOUT=1
#
# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Aliases
alias la="ls -al --color"
alias zshconfig="vim  ~/.zshrc"
alias pgp='pass git push origin master'
alias sp='sudo pacman' 
alias s='sudo systemctl'
alias nb='newsboat'
alias p='python'
alias gre='gpg -r m.payunen@gmail.com -e'
alias startx='startx ~/.config/x11/.xinitrc'
alias ls='ls --color'
alias scr='cd ~/.local/share/scripts'
alias dotf='cd ~/.config/dotfiles'
alias stopit='sudo runit-init 0'
alias vim='nvim'
alias apep8"=autopep8 --in-place --aggressive --aggressive"
alias yta="youtube-dl -x -f bestaudio/best"

#------------------------------
# Prompt
#------------------------------

autoload -U colors zsh/terminfo
colors

export PATH=~/.python/bin:$PATH
export GSIP=git.yasal.ru
# Load syntax highlighting; should be last.
source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh


