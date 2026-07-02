# Git
alias gl='git log --oneline --graph --all'

# Alias kubectl through minikube if minikube is installed but kubectl isn't
if command -v minikube &> /dev/null && ! command -v kubectl &> /dev/null; then
    alias kubectl="minikube kubectl --"
fi
