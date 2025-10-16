#!/usr/bin/env bash

# WARNING: source first
# Make sure this file gets sourced first.
# So others can make use of the vars.

# Check for nvim, vim and vi and set the default editor.
if command -v nvim &> /dev/null; then
    export EDITOR=nvim
elif command -v vim &> /dev/null; then
    export EDITOR=vim
elif command -v vi &> /dev/null; then
    export EDITOR=vi
fi
