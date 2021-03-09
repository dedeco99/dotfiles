export PATH="$PATH:/home/dedeco99/Documents/Programming/Bash/dotfiles/scripts:/home/dedeco99/Documents/Programming/zDBBackups:/home/dedeco99/Documents/Programming/Mobile/flutter/bin"
export EDITOR="nano"
export TERMINAL="kitty"
export BROWSER="firefox"
export QT_QPA_PLATFORMTHEME="qt5ct"

if [[ "$(tty)" = "/dev/tty1" ]]; then
	startx
fi
