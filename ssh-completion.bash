_ssh() {
    local cur prev opts config_files configd files configs
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"

    # complete for ssh configs
    config_files="$HOME/.ssh/config"
    configd="$HOME/.ssh/config.d"
    if [[ -d $configd && $(ls $configd|wc -l) -gt 0 ]]; then
        config_files="$config_files $HOME/.ssh/config.d/*"
    fi
    configs=$(grep '^Host' $config_files | grep -v '[?*]' | cut -d ' ' -f 2-)

    # copmlete for directories
    files=$(ls -d $cur* 2>/dev/null)

    # merge all candinate
    opts="${configs[*]} ${files[*]}"

    COMPREPLY=( $(compgen -W "$opts" -- ${cur}) )
    return 0
}

## set "-o filenames" to complete filenames
complete -o filenames -F _ssh ssh
complete -o filenames -F _ssh scp
