
echo ' $$$$$$\ $$\ $$$$$$$\             $$$$$$\                                         $$\   $$\                                   
 \_$$  _|$$ |$$  __$$\           $$  __$$\                                        $$$\  $$ |                                  
   $$ |  $$ |$$ |  $$ | $$$$$$\  $$ /  \__| $$$$$$\  $$$$$$$\  $$$$$$$$\ $$$$$$\  $$$$\ $$ | $$$$$$\  $$$$$$\$$$$\   $$$$$$\  
   $$ |  $$ |$$$$$$$  |$$  __$$\ \$$$$$$\  $$  __$$\ $$  __$$\ \____$$  |\____$$\ $$ $$\$$ |$$  __$$\ $$  _$$  _$$\ $$  __$$\ 
   $$ |  $$ |$$  __$$< $$$$$$$$ | \____$$\ $$$$$$$$ |$$ |  $$ |  $$$$ _/ $$$$$$$ |$$ \$$$$ |$$ /  $$ |$$ / $$ / $$ |$$$$$$$$ |
   $$ |  $$ |$$ |  $$ |$$   ____|$$\   $$ |$$   ____|$$ |  $$ | $$  _/  $$  __$$ |$$ |\$$$ |$$ |  $$ |$$ | $$ | $$ |$$   ____|
 $$$$$$\ $$ |$$ |  $$ |\$$$$$$$\ \$$$$$$  |\$$$$$$$\ $$ |  $$ |$$$$$$$$\\$$$$$$$ |$$ | \$$ |\$$$$$$  |$$ | $$ | $$ |\$$$$$$$\ 
 \______|\__|\__|  \__| \_______| \______/  \_______|\__|  \__|\________|\_______|\__|  \__| \______/ \__| \__| \__| \_______|'

setxkbmap -option caps:escape

export PATH=$PATH:/home/ilresenzanome/.spicetify

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="afowler"

ENABLE_CORRECTION="true"

plugins=(
	git
	zsh-autosuggestions
	zsh-syntax-highlighting
	zsh-history-substring-search
)

source $ZSH/oh-my-zsh.sh

# Pronmpt configuration

function dir_icon {
	if [[ "$PWD" == "$HOME" ]]; then
		echo "%B%F{black}%f%b"
	else
		echo "%B%F{cyan}%f%b"
	fi
}

function parse_git_branch {
	local branch
	branch=$(git symbolic-ref --short HEAD 2> /dev/null)
	if [ -n "$branch" ]; then
		echo " [$branch]"
	fi
}

PROMPT='%F{cyan}󰣇%f %F{magenta}%n%f $(dir_icon) %F{red}%~%f%${vcs_info_msg_0_} %F{yellow}$(parse_git_branch)%f %(?.%B%F{green}.%F{red})%f%b '

# Aliases

alias ls='lsd'
alias cat='bat'
alias htop-'btop'
alias m='ncmpcpp'
alias cq='nvim $HOME/.config/qtile/config.py'
alias image="kitten icat"
alias f="ranger"
alias e="emacs"
alias mpc='mpc --port 6601'
alias ra="ranger"
alias v="nvim"


