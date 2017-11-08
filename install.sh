#!/bin/bash


# .bash_profile
ln -sf ~/.home/bash_profile ~/.bash_profile

# tmux config
ln -sf ~/.home/tmux.conf ~/.tmux.conf

# local file
touch ~/.home/bash_profile.local


# commands
/bin/rm -rf ~/.bin
ln -sf ~/.home/bin ~/.bin

source ~/.bash_profile

echo "install over."
echo "enjoy your terminal life."
