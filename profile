export EDITOR="nano"
export TERMINAL="kitty"
export BROWSER="firefox"
export QT_QPA_PLATFORMTHEME="qt5ct"

if [[ "$(tty)" = "/dev/tty1" ]]; then
	startx
fi
