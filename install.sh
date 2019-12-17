#!/bin/bash


# .bash_profile
ln -sf ~/.home/bash_profile ~/.bash_profile

# .inputrc
ln -sf ~/.home/inputrc ~/.inputrc

# tmux config
ln -sf ~/.home/tmux.conf ~/.tmux.conf

# local file
touch ~/.home/bash_profile.local

source ~/.bash_profile

echo "enjoy your terminal life."
