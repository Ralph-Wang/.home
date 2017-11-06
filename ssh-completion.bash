_ssh() 
{
    local cur prev opts config_files configd
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    config_files="$HOME/.ssh/config"
    configd="$HOME/.ssh/config.d"
    if [[ -d $configd && $(ls $configd|wc -l) -gt 0 ]]; then
        config_files="$config_files $HOME/.ssh/config.d/*"
    fi
    opts=$(grep '^Host' $config_files | grep -v '[?*]' | cut -d ' ' -f 2-)

    COMPREPLY=( $(compgen -W "$opts" -- ${cur}) )
    return 0
}
complete -F _ssh ssh
complete -F _ssh scp
