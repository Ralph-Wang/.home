# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi
# User specific environment and startup programs

export EDITOR=vim
###########
# prompt
###########
flush_prompt() {
	RSLT=''

    if [[ "$VIRTUAL_ENV" ]]; then
		RSLT="[\[\033[33m\]py:\[\033[35m\]$(basename $VIRTUAL_ENV)\[\033[0m\]]"
        #statements
    fi

	GIT_BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/^* //'`
	if [ "$GIT_BRANCH" ]
	then
		GIT_STATUS=`git status 2> /dev/null | grep 'working tree clean'`
		CLR='2'
		if [ "$GIT_STATUS" ]
		then
			CLR='2'
		else
			CLR='3'
		fi
		RSLT="${RSLT}@\[\033[3${CLR}m\]${GIT_BRANCH}\[\033[0m\]"
	fi
    export PS1="\[\033[35m\][$$]\[\033[33m\](!\! j:\j)\[\033[0m\]@\[\033[1;31m\]\h\[\033[0m\]\[\033[32m\][\w]\[\033[0m\]$RSLT\[\033[0m\]\n\[\033[1;36m\]\u\[\033[1;33m\] -> \[\033[0m\]"
}
PROMPT_COMMAND="flush_prompt; $PROMPT_COMMAND"


export PATH=$HOME/.bin:$HOME/.local/bin:$PATH

# from kumu-linux -- color the man
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# pip bash completion start
eval "$(pip completion --bash)"

source ~/.profile

source ~/.alias

source ~/.bash_profile.local # 本地配置, 不进入 git 管理

# unbind C-s for stop stty
stty stop undef

# load rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" && rvm default

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
