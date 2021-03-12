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

# Basic auto/tab complete:
autoload -U compinit promptinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
promptinit
prompt clint
_comp_options+=(globdots)		# Include hidden files.
setopt COMPLETE_ALIASES


alias zshconfig="vim  ~/.zshrc"
alias pgp='pass git push origin master'
alias sp='sudo pacman' 
alias s='sudo systemctl'
alias nb='newsboat'
alias p='python'
alias gre='gpg -r m.payunen@gmail.com -e'
alias startx='startx ~/.xinitrc'
alias vim='nvim'
alias ls='ls --color'



export PATH
export GSIP=202102120.ru
# Load syntax highlighting; should be last.
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
