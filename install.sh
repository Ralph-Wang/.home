#!/bin/bash


# .bash_profile
rm -f ~/.bash_profile
ln -s ~/.home/bash_profile ~/.bash_profile

# .alias
rm -f ~/.alias
ln -s ~/.home/alias ~/.alias

# tmux config
rm -f ~/.tmux.conf
ln -s ~/.home/tmux.conf ~/.tmux.conf

# local file
rm -f ~/.bash_profile.local
touch ~/.home/bash_profile.local
ln -s ~/.home/bash_profile.local ~/.bash_profile.local
