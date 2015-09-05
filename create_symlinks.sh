#!/bin/bash

# Script interactively creates symlinks in user directory to config files from repository

ask() {
    # http://djm.me/ask
    while true; do

        if [ "${2:-}" = "Y" ]; then
            prompt="Y/n"
            default=Y
        elif [ "${2:-}" = "N" ]; then
            prompt="y/N"
            default=N
        else
            prompt="y/n"
            default=
        fi

        # Ask the question - use /dev/tty in case stdin is redirected from somewhere else
        read -p "$1 [$prompt] " REPLY </dev/tty

        # Default?
        if [ -z "$REPLY" ]; then
            REPLY=$default
        fi

        # Check if the reply is valid
        case "$REPLY" in
            Y*|y*) return 0 ;;
            N*|n*) return 1 ;;
        esac

    done
}

SCRIPT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
LINK="ln -is"

if ask "Symlink ~/.gitconfig?" Y; then
	$LINK $SCRIPT_DIR/git/.gitconfig ~/.gitconfig
fi

if ask "Symlink ~/.vimrc?" Y; then
	$LINK $SCRIPT_DIR/vim/.vimrc ~/.vimrc
fi

if ask "Symlink Oh-My-Fish configuration?" Y; then
	$LINK $SCRIPT_DIR/oh-my-fish/git.load ~/.oh-my-fish/custom/git.load
fi
