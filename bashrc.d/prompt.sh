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

# PROMPT_COMMAND executes before displaying the prompt, allowing us to save $?.
PROMPT_COMMAND='export LAST_EXIT_CODE=$?'

prompt_status() {
    
    # Check the return code of the last command ($?)
    if [ $LAST_EXIT_CODE -eq 0 ]; then
        # Success (Bold Green)
	ICON_COLOR=32
    else
	# Failure (Bold Red)
	ICON_COLOR=31
    fi

    echo -e "\e[1;${ICON_COLOR}m\e[0m"
}

# Prompt
PS1="\$(prompt_status '(%s) ')  ${DIR_COLOR}\w${GIT_COLOR}\$(__git_ps1 ' 󰊢 (%s)')${RESET_COLOR}\$ "

