# .bashrc

## file include macro, tests for readability
include() {
	local arg

	for arg; do
		if [ -r "$arg" ]; then
			. "$arg"
		fi
	done
}

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# Source aliases
if [ -f ~/.alias ]; then
    . ~/.alias
fi

# Setup the proxy
export http_proxy=http://webproxy:3128/
export https_proxy=$http_proxy
export ftp_proxy=$http_proxy
export rsync_proxy=$http_proxy
export no_proxy="localhost,127.0.0.1,localaddress,.localdomain.com"

#########################################
############# PS1

RED='\[\033[00;31m\]\]'
GREEN='\[\033[00;32m\]\]'
YELLOW='\[\033[00;33m\]\]'
BLUE='\[\033[00;34m\]\]'
PURPLE='\[\033[00;35m\]\]'
CYAN='\[\033[00;36m\]'

LIGHTGRAY='\[\033[00;37m\]\]'
RESET='\[\e[0m\]'

LRED='\033[01;31m'
LGREEN='\033[01;32m'
LYELLOW='\033[01;33m'
LBLUE='\033[01;34m'
LPURPLE='\033[01;35m'
LCYAN='\033[01;36m'
WHITE='\033[01;37m'

bold='\['`tput bold`'\]'        ; [ $bold = '\[\]' ] && bold=
roman='\['`tput sgr0`'\]'       ; [ $roman = '\[\]' ] && roman=
red='\['`tput setaf 1`'\]'      ; [ $red = '\[\]' ] && red=
yellow='\['`tput setaf 3`'\]'   ; [ $yellow = '\[\]' ] && yellow=
normal='\['`tput setaf 9`'\]'   ; [ $normal = '\[\]' ] && normal=

TMUX_ID=`echo $TMUX | perl -ne '$_ =~ m/,(\d+)$/; print $1'`
TMUX_PS1=""
if [ ! -z $TMUX_ID ]; then
    TMUX_PS1="$RED(tmux $TMUX_ID)$RESET "
fi

USER_PS1=""
if [ "$(whoami)" != "knamburi" ]; then
    USER_PS1="\u@"
fi

PS1="$GREEN$normal" #\u@$normal\h $bold$YELLOW\W:" #\n $CYAN~\\$\[\e[0m\] "
PS1="$RESET$TMUX_PS1$GREEN\u$RESET@\h $YELLOW\W:$RESET\n $CYAN~\\$ $RESET"

########################################


complete -W "$(</etc/hosts.booking)" ssh


## interactive shell?
if [ -n "$PS1" ]; then
	## interactive shell, so non-interactive, non-login child shells
	## should also load this file if started manually
	export BASH_ENV="~/.bashrc"

	## include only in interactive shells
	include ~/.bash_functions ~/.bash_aliases ~/.bash_prompt \
		~/.bashrci ~/.bash_local
fi

################################################################################################
## Fix Tmux
# Launch SSH agent if not running
if ! ps aux |grep $(whoami) |grep ssh-agent |grep -v grep >/dev/null; then ssh-agent ; fi

# Link the latest ssh-agent socket
ln -sf $(find /tmp -maxdepth 2 -type s -name "agent*" -user $USER -printf '%T@ %p\n' 2>/dev/null |sort -n|tail -1|cut -d' ' -f2) ~/.ssh/ssh_auth_sock

export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock

export EDITOR="vim"
if [[ $TERM == xterm ]]; then
    export TERM="xterm-256color"
fi

alias tmux="tmux -2"
alias ls="ll"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
