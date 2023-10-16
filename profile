export MODE="single"
export PATH="$PATH:/home/dedeco99/Programming/Active Projects/dotfiles/scripts:/opt/flutter/bin"
export EDITOR="nano"
export TERMINAL="kitty"
export BROWSER="brave"
export QT_QPA_PLATFORMTHEME="qt5ct"
export CHROME_EXECUTABLE=brave

if [[ "$(tty)" = "/dev/tty1" ]]; then
	startx
fi
