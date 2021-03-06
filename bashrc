source "$HOME/.rvm/scripts/rvm"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export GOPATH=$HOME/golib
export GOROOT="/usr/lib/go"

#Settings
#/********************************************************************/
export HISTTIMEFORMAT="$(echo -e ${BCyan})[%d/%m %H:%M:%S]$(echo -e ${NC}) "
set -o vi

#Aliases
#/********************************************************************/
alias disk='df -h | grep -e /dev/sd -e Filesystem'
alias dfh='df -kTh'

alias systems='cd ~/CSI/systems'
alias docs='cd ~/CSI/documentation'
alias ans='cd ~/CSI/ansible-playbooks'
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../..'
alias back='cd $OLDPWD'

alias sobash='source ~/.bashrc'
alias edbash='nvim ~/.bashrc'
alias root='sudo su'
alias debugshell='set -o nounset -o; set -o xtrace'

alias install='sudo apt-get install'
alias update='sudo apt-get update'
alias upgrade='sudo apt-get upgrade'
alias purge='sudo apt-get purge'
alias chrome='chromium-browser'
alias nim='nvim'
alias snim='sudo nvim'


#Functions
#/********************************************************************/
function psgrep() {
	if [ ! -z $1 ] ; then
		echo "Grepping for processes matching $1..."
		ps aux | grep $1 | grep -v grep
	else
		echo "ERROR: Need process name to grep for."
	fi
}

function extract () {
	if [ -f $1 ] ; then
		case $1 in
			*.tar.bz2)	tar xjfv $1		;;
			*.tar.gz)	tar xzfv $1		;;
			*.bz2)		bunzip2 $1		;;
			*.gz)		gunzip $1		;;
			*.tar)		tar xfv $1		;;
			*.tbz2)		tar xjfv $1		;;
			*.tgz)		tar xzfv $1		;;
			*.zip)		unzip $1		;;
			*.Z)		uncompress $1	;;
			*)			echo "'$1' cannot be extracted via extract()" ;;
		esac
	else
		echo "'$1' is not a valid file"
	fi
}

function maketar() { 
	tar cvzf "${1%%/}.tar.gz"  "${1%%/}/";
}

function swap() { 
    local TMPFILE=tmp.$$

    [ $# -ne 2 ] && echo "swap: 2 arguments needed" && return 1
    [ ! -e $1 ] && echo "swap: $1 does not exist" && return 1
    [ ! -e $2 ] && echo "swap: $2 does not exist" && return 1

    mv "$1" $TMPFILE
    mv "$2" "$1"
    mv $TMPFILE "$2"
}

function bak() {
	cp "$1" "$1".bak
}

if [ "$TERM" == "xterm" ]; then
    # No it isn't, it's gnome-terminal
    export TERM=xterm-256color
fi
