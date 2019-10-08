# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# prompt
flush_prompt() {
	RSLT=''

    if [[ "$(command -v pyenv)" != "" ]]; then
		RSLT="[\[\033[33m\]py:\[\033[35m\]$(pyenv version-name)\[\033[0m\]]"
    fi

    if [[ "$VIRTUAL_ENV" ]]; then
		RSLT="[\[\033[33m\]venv:\[\033[35m\]$(basename $VIRTUAL_ENV)\[\033[0m\]]"
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

# unbind C-s to stop stty
stty stop undef

# nvm init
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

source ~/.profile

source ~/.home/commands

source ~/.home/alias

source ~/.home/cdmark

source ~/.home/python_virtual_env

# source other environments
source ~/.home/environments

# enable git completion
source ~/.home/completion.d/git-completion.bash

# enable ssh completion
source ~/.home/completion.d/ssh-completion.bash

# enable gradle completion
source ~/.home/completion.d/gradle-completion.bash

# enable pyenv init
if command -v pyenv 1>/dev/null 2>&1;then
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi

# pip bash completion start
eval "$(pip completion --bash)"


source ~/.home/bash_profile.local # 本地配置, 不进入 git 管理
