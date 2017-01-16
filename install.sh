#!/bin/sh


packages () {
    sudo apt install i3
    sudo apt install neovim
    sudo apt install zsh
    sudp apt install xfce4-terminal
    sudo apt install compton
    sudo apt install redshift
    sudo apt install git
    sudo apt install curl
}

repos () {
    # i3 gaps
    mkdir ~/.i3gapsrepo/
    git clone git@github.com:Airblader/i3.git ~/.i3gapsrepo/i3-gaps/
    cd ~/.i3gapsrepo/i3-gaps/
	# Dependencies
	sudo apt install libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev xcb libxcb1-dev libxcb-icccm4-dev libyajl-dev libev-dev libxcb-xkb-dev libxcb-cursor-dev libxkbcommon-dev libxcb-xinerama0-dev libxkbcommon-x11-dev libstartup-notification0-dev libxcb-randr0-dev libxcb-xrm0 libxcb-xrm-dev
	# compile & install
	autoreconf --force --install
	rm -rf build/
	mkdir -p build && cd build/
	# Disabling sanitizers is important for release versions!
	# The prefix and sysconfdir are, obviously, dependent on the distribution.
	../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers
	make
	sudo make install

	# i3blocks-gaps
    cd ~/.i3gapsrepo/
    git clone git@github.com:Airblader/i3blocks-gaps.git i3blocks-gaps/
    cd i3blocks-gaps/
    make
    cp i3blocks /usr/local/bin/i3blocks

	# Powerline Fonts
	cd ~/
	git clone git@github.com:powerline/fonts.git powerlinefonts/
	cd powerlinefonts
    ./install.sh
    cd ..
    rm -rf powerlinefonts

    # oh-my-zsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
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

    rm -f ~/.Xmodmap
    ln -s ~/.dotfiles/Xmodmap ~/.Xmodmap

    mkdir ~/.config/

    ln -s ~/.dotfiles/i3/ ~/.config/i3/
    ln -s ~/.dotfiles/i3blocks/ ~/.config/i3blocks/
    ln -s ~/.dotfiles/xfce4/ ~/.config/xfce4/
    ln -s ~/.dotfiles/ncmpcpp/ ~/.config/ncmpcpp/
    ln -s ~/.dotfiles/fontconfig/ ~/.config/fontconfig/
    ln -s ~/.dotfiles/compton.conf ~/.config/compton.conf
    ln -s ~/.dotfiles/redshift.conf ~/.config/redshift.conf

    mkdir ~/.config/nvim/
    ln -s ~/.vimrc ~/.config/nvim/init.vim
}

echo "Please don't use this! It may break everything!"
