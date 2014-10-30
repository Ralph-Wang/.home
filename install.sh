#!/bin/bash


# .bash_profile
ln -sf ~/.home/bash_profile ~/.bash_profile

# .alias
ln -sf ~/.home/alias ~/.alias

# tmux config
ln -sf ~/.home/tmux.conf ~/.tmux.conf

# local file
touch ~/.home/bash_profile.local
ln -sf ~/.home/bash_profile.local ~/.bash_profile.local

# commands
ln -sf ~/.home/bin ~/.bin