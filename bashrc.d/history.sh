# Append to history, don't overwrit
shopt -s histappend

# Search history with up/down arrows after typing something
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# Bigger and better history
export HISTSIZE=5000
export HISTFILESIZE=10000
export HISTCONTROL=ignoredups:erasedups
export HISTIGNORE="ls:bg:fg:history"
