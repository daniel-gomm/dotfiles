#!/bin/bash
install_basics(){
	echo Installing vim...
	apt-get install vim
	#echo Setting up vim...
	echo Installing zsh...
	apt-get install zsh
	chsh -s $(which zsh)
	echo Installing oh-my-zsh...
	sh ~/.oh-my-zsh/install.sh
}

install_desktop_applications(){
	echo Installing desktop applications...
        echo Installing urxvt...
        apt install rxvt-unicode
        xrdb -merge .Xresources
	echo Installing chrome...
	wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
	sudo apt install ./google-chrome-stable_current_amd64.deb
	rm ./google-chrome-stable_current_amd64.deb
}

usage(){
	cat <<EOF
	Usage:  ./.install.sh 			Install Core applications and configurations
		./.install.sh desktop 		Additionally install desktop applications
EOF
}

if [ -z "$1" ]; then
	install_basics
elif [ "$1" == "desktop" ]; then
	install_basics
	install_desktop_applications
else
	usage
fi
