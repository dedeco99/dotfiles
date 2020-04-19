export EDITOR="nano"
export TERMINAL="kitty"
export BROWSER="firefox"

if [[ "$(tty)" = "/dev/tty1" ]]; then
	startx
fi
