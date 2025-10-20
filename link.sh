function parseArgs() {
	[ ! -d ~/.config/dunst ] && mkdir ~/.config/dunst
	cp ./dunst/dunstrc ~/.config/dunst/dunstrc
	cp ./gtk/gtkrc-2.0 ~/.gtkrc-2.0
	[ ! -d ~/.config/mpd ] && mkdir ~/.config/mpd
	cp ./mpd/mpd.conf ~/.config/mpd/mpd.conf
	[ ! -d ~/.config/ncmpcpp ] && mkdir ~/.config/ncmpcpp
	cp ./ncmpcpp/config ~/.config/ncmpcpp/config
	cp ./ncmpcpp/bindings ~/.config/ncmpcpp/bindings
	

	[ ! -d ~/.config ] && mkdir ~/.config
	stow -d ${PWD} -t ~ zsh
	[ ! -d ~/.config/hypr ] && mkdir ~/.config/hypr
	stow -d ${PWD} -t ~/.config/hypr hypr
	[ ! -d ~/.config/waybar ] && mkdir ~/.config/waybar
	stow -d ${PWD} -t ~/.config/waybar waybar
	[ ! -d ~/.config/matugen ] && mkdir ~/.config/matugen
	stow -d ${PWD} -t ~/.config/matugen matugen
	[ ! -d ~/.config/kitty ] && mkdir ~/.config/kitty
	stow -d ${PWD} -t ~/.config/kitty kitty
	[ ! -d ~/.config/rofi ] && mkdir ~/.config/rofi
	stow -d ${PWD} -t ~/.config/rofi rofi
	[ ! -d ~/.config/gtk-3.0 ] && mkdir ~/.config/gtk-3.0
	stow -d ${PWD} -t ~/.config/gtk-3.0 gtk-3.0
	[ ! -d ~/.config/gtk-4.0 ] && mkdir ~/.config/gtk-4.0
	stow -d ${PWD} -t ~/.config/gtk-4.0 gtk-4.0
	[ ! -d /etc/ly ] && mkdir /etc/ly
	stow -d ${PWD} -t /etc/ly ly
}

parseArgs "$@"
