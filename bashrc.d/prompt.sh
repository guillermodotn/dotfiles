# ~/.bashrc.d/prompt.sh

GIT_PS1_SHOWDIRTYSTATE=1

# Colors
COLOR_RED='\[\e[1;31m\]'	# Bold red
COLOR_GREEN='\[\e[1;32m\]'	# Bold green
COLOR_BLUE='\[\e[1;34m\]'	# Bold blue
COLOR_PURPLE='\[\e[1;35m\]'	# Bold purple
COLOR_CYAN='\[\e[1;36m\]'	# Bold cyan
COLOR_YELLOW='\[\e[0;33m\]'	# Yellow
COLOR_RESET='\[\e[0m\]'

# Git branch support
if [ -f /usr/share/git-core/contrib/completion/git-prompt.sh ]; then
    source /usr/share/git-core/contrib/completion/git-prompt.sh
fi

_prompt_dir() {
    if [ "$PWD" = "$HOME" ]; then
        printf " "
    else
        printf "\w"
    fi
}

_get_prompt_arrow() {
    local EXIT_CODE="$1"
    
    if [ "$EXIT_CODE" -eq 0 ]; then
        # INFO: The raw symbol '' is printed in bold green
        printf "%s%s" "$COLOR_GREEN" "$COLOR_RESET"
    else
        # INFO: Bold Red Arrow 
        printf "%s%s" "$COLOR_RED" "$COLOR_RESET"
    fi
}


PROMPT_COMMAND='
	LAST_EXIT_CODE=$?;
	PROMPT_ARROW=$(_get_prompt_arrow "$LAST_EXIT_CODE");
	PROMPT_DIR=$(_prompt_dir);
	PROMPT_GIT=$(__git_ps1 " 󰊢 (%s)");
	PS1="${COLOR_CYAN}${PROMPT_DIR}${COLOR_RESET}${COLOR_YELLOW}${PROMPT_GIT}${COLOR_RESET} ${PROMPT_ARROW} ";
'
