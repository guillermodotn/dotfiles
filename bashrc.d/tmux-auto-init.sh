#!/usr/bin/bash

# Tmux auto-attach/create
if command -v tmux &> /dev/null && [ -z "$TMUX" ] && [ -z "$ENV_VAR" ]; then
	tmux attach -t main || tmux new -s main -n $(basename $EDITOR) -c $EDITOR \; new-window
elif command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
	tmux attach -t main || tmux new -s main
fi
