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

# POWERLEVEL9K_MODE="nerdfont-complete"
# POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=$'\uE0BC'
# POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=$'\uE0BA'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()
# POWERLEVEL9K_PROMPT_ON_NEWLINE=true

# Tell Antigen that you're done.
antigen apply

# Aliases
alias ssh="kitty +kitten ssh"

alias zshconfig="nano ~/.zshrc"
alias kittyconfig="nano ~/.config/kitty/kitty.conf"
alias i3config="nano ~/.i3/config"

alias update="pamac checkupdates -a"
alias upgrade="pamac upgrade -a"
alias install="pamac install"
alias search="pamac search"

entertainmentHubSSH(){
    eval `ssh-agent -s`
    ssh-add ~/.ssh/entertainmenthub
    ssh $1
}

alias rodrigo="ssh pi@rodrigobot.ddns.net"
alias entertainmenthub="entertainmentHubSSH 34.91.118.153"

alias programming="cd ~/Documents/Programming/Web/node"

alias updatecoins="cd ~/Documents/Programming/Python/coinmarketcap && python coinmarketcap.py"
alias updateinsta="cd ~/Documents/Programming/Python/Instaloader && sh instaloader.sh"

alias timer="termdown -b --no-figlet"

# Rebind
#bindkey '^I' autosuggest-accept
#bindkey '^[OC' expand-or-complete

export EDITOR="nano"
