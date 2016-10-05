#!/bin/sh


packages () {
    sudo apt install zsh
    sudp apt install xfce4-terminal
    sudo apt install compton
    sudo apt install redshift
    sudo apt install git
    sudo apt install curl
}

repos () {
    #TODO
    mkdir ~/.i3gapsrepo/
    git clone git@github.com:Airblader/i3.git ~/.i3gapsrepo/i3-gaps/
}

dotfiles () {
    mkdir ~/.dotfiles
    git clone git@github.com:Nerfan/dotfiles.git ~/.dotfiles

    # Link everything that should be linked.
    # Remove the existing file, if any, beforehand.
    rm -f ~/.vimrc
    ln -s ~/.dotfiles/vimrc ~/.vimrc

    rm -f ~/.zshrc
    ln -s ~/.dotfiles/zshrc ~/.zshrc

    rm -f ~/.Xresources
    ln -s ~/.dotfiles/Xresources ~/.Xresources

    mkdir ~/.config/

    ln -s ~/.dotfiles/i3/ ~/.config/i3/
    ln -s ~/.dotfiles/i3blocks/ ~/.config/i3blocks/
    ln -s ~/.dotfiles/xfce4/ ~/.config/xfce4/
    ln -s ~/.dotfiles/ncmpcpp/ ~/.config/ncmpcpp/
    ln -s ~/.dotfiles/fontconfig/ ~/.config/fontconfig/
    ln -s ~/.dotfiles/compton.conf/ ~/.config/compton.conf
    ln -s ~/.dotfiles/redshift.conf/ ~/.config/redshift.conf
    ln -s ~/.dotfiles/Xresources ~/.Xresources

    mkdir ~/.config/nvim/
    ln -s ~/.vimrc ~/.config/nvim/init.vim
}

echo "Please don't use this! It may break everything!"
