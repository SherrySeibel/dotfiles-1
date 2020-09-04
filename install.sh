#!/bin/sh

if [ ! -d "$HOME/.yadr" ]; then
    echo "Installing Sherry's YADR for the first time"
    git clone https://github.com/SherrySeibel/dotfiles-1.git "$HOME/.yadr"
    # Create pull from original repo if still want access
    git remote add old https://github.com/skwp/dotfiles
    cd "$HOME/.yadr"
    [ "$1" = "ask" ] && export ASK="true"
    rake install
else
    echo "Sherry's YADR is already installed"
fi
