source ~/antigen.zsh

# Plugins
# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions

# Load the theme.
#antigen theme agnoster
antigen theme bhilburn/powerlevel9k powerlevel9k

# Tell Antigen that you're done.
antigen apply

POWERLEVEL9K_MODE="nerdfont-complete"
POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=$'\uE0BC'
POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=$'\uE0BA'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(vcs ssh date time)
POWERLEVEL9K_PROMPT_ON_NEWLINE=true

# Aliases
alias ssh="kitty +kitten ssh"

alias zshconfig="nano ~/.zshrc"
alias kittyconfig="nano ~/.config/kitty/kitty.conf"
alias i3config="nano ~/.i3/config"

alias update="sudo pacman -Syu"
alias install="sudo pacman -Syu"
alias search="pacman -Ss"

alias rodrigo="ssh pi@rodrigobot.ddns.net"

alias programming="cd ~/Documents/Programming/Web/node"

alias updatecoins="cd ~/Documents/Programming/Python/coinmarketcap && python coinmarketcap.py"
alias updateinsta="cd ~/Documents/Programming/Python/Instaloader && sh instaloader.sh"

alias timer="termdown -b --no-figlet"

# Work aliases
alias sls="sls --aws-profile Shop2Grow"

alias projects="cd ~/Documents/Projects"
alias shop="cd ~/Documents/Projects/shop2grow_api/services"

# Rebind
#bindkey '^I' autosuggest-accept
#bindkey '^[OC' expand-or-complete

export EDITOR="nano"
