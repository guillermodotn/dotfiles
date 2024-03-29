
# Pyenv inizializatoin
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

# Docker autocompletion
autoload -U compinit && compinit

