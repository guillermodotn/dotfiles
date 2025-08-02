# ~/.bashrc.d/prompt.sh

GIT_PS1_SHOWDIRTYSTATE=1

# Colors
USER_COLOR='\[\e[1;32m\]'   # Bold green
HOST_COLOR='\[\e[1;34m\]'   # Bold blue
DIR_COLOR='\[\e[1;36m\]'    # Bold cyan
GIT_COLOR='\[\e[0;33m\]'    # Yellow
RESET_COLOR='\[\e[0m\]'

# Git branch support
if [ -f /usr/share/git-core/contrib/completion/git-prompt.sh ]; then
    source /usr/share/git-core/contrib/completion/git-prompt.sh
fi

# Prompt
PS1="${USER_COLOR}\u${RESET_COLOR}@${HOST_COLOR}\h ${DIR_COLOR}\w${GIT_COLOR}\$(__git_ps1 ' (%s)')${RESET_COLOR}\$ "

