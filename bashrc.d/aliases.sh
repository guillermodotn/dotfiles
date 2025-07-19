alias c='clear'                      # Clear screen
alias h='history'                    # Show command history

# Navigation aliases
# Alias https://github.com/lsd-rs/lsd
if command -v lsd &> /dev/null; then
    alias ls='lsd'
fi
alias ll='ls -lah'                   # Detailed list
alias la='ls -A'                     # List all except . and ..
alias ..='cd ..'                     # Go up one dir
alias ...='cd ../..'                 # Go up two dirs

# Python
alias py='python'

# Git
alias gl='git log --oneline --graph --all'

# Alias podman as docker if podman is installed and docker isn't
if command -v podman &> /dev/null && ! command -v docker &> /dev/null; then
    alias docker='podman'
fi


# Alias kubectl through minikube if minikube is installed but kubectl isn't
if command -v minikube &> /dev/null && ! command -v kubectl &> /dev/null; then
    alias kubectl="minikube kubectl --"
fi

# Alias code as codium
if command -v codium &> /dev/null && ! command -v code &> /dev/null; then
    alias code='codium'
fi