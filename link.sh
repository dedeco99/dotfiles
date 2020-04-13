function parseArgs() {
	if [ "$1" == "i3" ]; then
		cp ./i3/config ~/.i3/config
		cp -r ./i3status/* ~/.config/i3status/
		chmod +x ~/.config/i3status/net-speed.sh
	elif [ "$1" == "bspwm" ]; then
		cp ./bspwm/bspwmrc ~/.config/bspwm/bspwmrc
		cp ./sxhkd/sxhkdrc ~/.config/sxhkd/sxhkdrc
	fi

	cp ./profile ~/.profile
	cp ./zsh/antigen.zsh ~/antigen.zsh
	cp ./zsh/oh-my-zsh.sh ~/oh-my-zsh.sh
	cp ./zsh/.zshrc ~/.zshrc
	cp ./kitty/kitty.conf ~/.config/kitty/kitty.conf
}


parseArgs "$@"