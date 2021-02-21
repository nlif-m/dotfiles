
export ZSH="/home/nlif/.oh-my-zsh"

ZSH_THEME="fox"

plugins=(git sudo zsh-autosuggestions z)

source $ZSH/oh-my-zsh.sh

alias zshconfig="vim  ~/.zshrc"
alias ohmyzsh="vim  ~/.oh-my-zsh"
alias pgp='pass git push origin master'
alias sp='sudo pacman' 
alias s='sudo systemctl'

alias gre='gpg -r m.payunen@gmail.com -e'

_Z_DATA=$HOME/.config/.z


path+=('~/code/liblarch')
path+=('~/.scripts')
export PATH
export GSIP=202102120.ru
