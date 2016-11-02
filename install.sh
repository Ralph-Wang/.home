#!/bin/bash


# .bash_profile
ln -sf ~/.home/bash_profile ~/.bash_profile

# .alias
ln -sf ~/.home/alias ~/.alias

# .cdmark
ln -sf ~/.home/cdmark ~/.cdmark

# tmux config
ln -sf ~/.home/tmux.conf ~/.tmux.conf

# local file
touch ~/.home/bash_profile.local
ln -sf ~/.home/bash_profile.local ~/.bash_profile.local

# commands
/bin/rm -rf ~/.bin
ln -sf ~/.home/bin ~/.bin

source ~/.bash_profile
