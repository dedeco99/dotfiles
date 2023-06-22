export PATH="$PATH:/home/dedeco99/Programming/Terminal/Bash/dotfiles/scripts:/home/dedeco99/Programming/Mobile/flutter/bin"
export EDITOR="nano"
export TERMINAL="kitty"
export BROWSER="brave"
export QT_QPA_PLATFORMTHEME="qt5ct"

if [[ "$(tty)" = "/dev/tty1" ]]; then
	startx
fi
