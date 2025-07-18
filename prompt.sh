# ~/.bashrc.d/prompt.sh

# Function to display the current Git branch with color based on Git status
git_branch() {
    # Check if we're inside a git repository
    local branch
    branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)

    if [ -n "$branch" ]; then
        # Default color for Git branch (blue)
        local git_color='\e[0;34m'

        # Check if there are untracked files or changes
        if git status --porcelain | grep -q "??"; then
            # Untracked files (yellow)
            git_color='\e[0;33m'
        elif git status --porcelain | grep -q '^[AM]\|^ M'; then
            # Modified or added files (yellow)
            git_color='\e[0;33m'
        fi

        # Return the formatted branch with status,
        # wrapping the color codes with \[ and \] so Bash knows they are non-printing.
        # Also, add a reset at the end of the branch output.
        echo -e "\[${git_color}\] (${branch})\[\e[0m\]"
    fi
}

# Set bold color for user based on EUID
if [[ $EUID -eq 0 ]]; then
    USER_COLOR='\[\e[1;31m\]'  # Bold red for root
elif [[ $EUID -eq 1000 ]]; then
    USER_COLOR='\[\e[1;32m\]'  # Bold green for main user
else
    USER_COLOR='\[\e[1;34m\]'  # Bold blue for others
fi

# Bold white color for separators
SEP_COLOR='\[\e[1;37m\]'

# Check if connected over SSH
if [[ -n "$SSH_CONNECTION" || -n "$SSH_TTY" ]]; then
    HOST_COLOR='\[\e[1;35m\]'  # Bold magenta for remote host
else
    HOST_COLOR='\[\e[1;32m\]'  # Bold green for localhost
fi

# Build PS1 prompt with conditional color for host
#PS1="${USER_COLOR}\u${SEP_COLOR}@${HOST_COLOR}\h${SEP_COLOR}:${USER_COLOR}\w\[\e[0m\]$(git_branch)${SEP_COLOR}\$ \[\e[0m\]"
PS1="${USER_COLOR}\u${SEP_COLOR}@${HOST_COLOR}redhat${SEP_COLOR}:${USER_COLOR}\w\[\e[0m\]$(git_branch)${SEP_COLOR}\$ \[\e[0m\]"