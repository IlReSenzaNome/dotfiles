export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh

setxkbmap -option caps:escape

alias ls='lsd'
alias cat='bat'
alias htop-'btop'
alias m='ncmpcpp'
alias cq='nvim $HOME/.config/qtile/config.py'
alias image="kitten icat"
alias f="ranger"
alias e="emacs"
alias mpc='mpc --port 6601'

export PATH=$PATH:/home/ilresenzanome/.spicetify
