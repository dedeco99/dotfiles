function parseArgs() {
	[ ! -d ~/.config ] && mkdir ~/.config
	if [ "$1" == "i3" ]; then
		cp ./i3/config ~/.i3/config
		cp -r ./i3status/* ~/.config/i3status/
		chmod +x ~/.config/i3status/net-speed.sh
	elif [ "$1" == "bspwm" ]; then
		[ ! -d ~/.config/bspwm ] && mkdir ~/.config/bspwm
		cp ./bspwm/bspwmrc ~/.config/bspwm/bspwmrc
		[ ! -d ~/.config/sxhkd ] && mkdir ~/.config/sxhkd
		cp ./sxhkd/sxhkdrc ~/.config/sxhkd/sxhkdrc
		cp ./bspwm/monitorMode ~/.config/bspwm/monitorMode
	fi

	cp ./xorg/xinitrc ~/.xinitrc
	cp ./xorg/Xresources ~/.Xresources
	cp ./profile ~/.zprofile
	cp ./zsh/antigen.zsh ~/antigen.zsh
	cp ./zsh/zshrc ~/.zshrc
	cp ./crontab/dedeco99 /var/spool/cron/dedeco99
	[ ! -d ~/.config/kitty ] && mkdir ~/.config/kitty
	cp ./kitty/kitty.conf ~/.config/kitty/kitty.conf
	[ ! -d ~/.config/dunst ] && mkdir ~/.config/dunst
	cp ./dunst/dunstrc ~/.config/dunst/dunstrc
	[ ! -d ~/.config/gtk-3.0 ] && mkdir ~/.config/gtk-3.0
	cp ./gtk/gtkrc-2.0 ~/.gtkrc-2.0
	cp ./gtk/gtkrc-3.0 ~/.config/gtk-3.0/settings.ini
	[ ! -d ~/.config/polybar ] && mkdir ~/.config/polybar
	cp ./polybar/config ~/.config/polybar/config
	cp ./polybar/launch.sh ~/.config/polybar/launch.sh
	cp ./polybar/updates.sh ~/.config/polybar/updates.sh
	cp ./polybar/tipy.sh ~/.config/polybar/tipy.sh
	chmod +x ~/.config/polybar/updates.sh
	[ ! -d ~/.config/mpd ] && mkdir ~/.config/mpd
	cp ./mpd/mpd.conf ~/.config/mpd/mpd.conf
	[ ! -d ~/.config/ncmpcpp ] && mkdir ~/.config/ncmpcpp
	cp ./ncmpcpp/config ~/.config/ncmpcpp/config
	cp ./ncmpcpp/bindings ~/.config/ncmpcpp/bindings
	[ ! -d ~/.config/rofi ] && mkdir ~/.config/rofi
	cp ./rofi/config.rasi ~/.config/rofi/config.rasi
	cp ./rofi/theme.rasi ~/.config/rofi/theme.rasi
}

parseArgs "$@"
