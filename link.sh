function parseArgs() {
	[ ! -d ~/.config ] && mkdir ~/.config

	cp ./profile ~/.zprofile
	cp ./zsh/antigen.zsh ~/antigen.zsh
	cp ./zsh/zshrc ~/.zshrc
	[ ! -d ~/.config/kitty ] && mkdir ~/.config/kitty
	cp ./kitty/kitty.conf ~/.config/kitty/kitty.conf
	[ ! -d ~/.config/dunst ] && mkdir ~/.config/dunst
	cp ./dunst/dunstrc ~/.config/dunst/dunstrc
	[ ! -d ~/.config/gtk-3.0 ] && mkdir ~/.config/gtk-3.0
	cp ./gtk/gtkrc-2.0 ~/.gtkrc-2.0
	cp ./gtk/gtkrc-3.0 ~/.config/gtk-3.0/settings.ini
	[ ! -d ~/.config/mpd ] && mkdir ~/.config/mpd
	cp ./mpd/mpd.conf ~/.config/mpd/mpd.conf
	[ ! -d ~/.config/ncmpcpp ] && mkdir ~/.config/ncmpcpp
	cp ./ncmpcpp/config ~/.config/ncmpcpp/config
	cp ./ncmpcpp/bindings ~/.config/ncmpcpp/bindings
	[ ! -d ~/.config/rofi ] && mkdir ~/.config/rofi
	cp ./rofi/config.rasi ~/.config/rofi/config.rasi
	cp ./rofi/theme.rasi ~/.config/rofi/theme.rasi
	[ ! -d ~/.config/hypr ] && mkdir ~/.config/hypr
	cp ./hypr/hyprland.conf ~/.config/hypr/hyprland.conf
	[ ! -d ~/.config/waybar ] && mkdir ~/.config/waybar
	cp ./waybar/config ~/.config/waybar/config
}

parseArgs "$@"
