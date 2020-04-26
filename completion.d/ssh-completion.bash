_ssh() {
    local cur opts config_files configd files configs
    cur="${COMP_WORDS[COMP_CWORD]}"

    ## complete for ssh configs
    config_files="$HOME/.ssh/config"
    configd="$HOME/.ssh/config.d"

    # ensure the directory is exist
    if [[ -d $configd && $(ls $configd|wc -l) -gt 0 ]]; then
        config_files="$config_files $HOME/.ssh/config.d/*"
    fi

    # get ssh configs
    configs=$(grep '^Host' $config_files | grep -v '[?*]' | cut -d ' ' -f 2-)
    ## complete for ssh configs end

    # copmlete for directories
    files=$(ls -d $cur* 2>/dev/null)

    # merge all candinates
    opts="${configs[*]} ${files[*]}"

    COMPREPLY=() # clean up to escape from other functions
    COMPREPLY=( $(compgen -W "$opts" -- ${cur}) )
    return 0
}

## set "-o filenames" to complete filenames
complete -o filenames -F _ssh ssh
complete -o filenames -F _ssh scp
