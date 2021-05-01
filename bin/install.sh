#!/bin/bash

DOTFILES="$(pwd)"
COLOR_GRAY="\033[1;38;5;243m"
COLOR_BLUE="\033[1;34m"
COLOR_GREEN="\033[1;32m"
#COLOR_RED="\033[1;31m"
COLOR_PURPLE="\033[1;35m"
#COLOR_YELLOW="\033[1;33m"
COLOR_NONE="\033[0m"

title() {
    echo "${COLOR_PURPLE}$1${COLOR_NONE}"
    echo "${COLOR_GRAY}==============================${COLOR_NONE}"
}

#error() {
#    echo -e "${COLOR_RED}Error: ${COLOR_NONE}$1"
#    exit 1
#}

#warning() {
#    echo -e "${COLOR_YELLOW}Warning: ${COLOR_NONE}$1"
#}

info() {
    echo "${COLOR_BLUE}Info: ${COLOR_NONE}$1"
}

success() {
    echo "${COLOR_GREEN}$1${COLOR_NONE}"
}

setup_git() {
    title "Setting up Git"

    defaultName=$(git config user.name)
    defaultEmail=$(git config user.email)

    read -rp "Name [$defaultName] " name
    read -rp "Email [$defaultEmail] " email

    git config --global user.name "${name:-$defaultName}"
    git config --global user.email "${email:-$defaultEmail}"

    read -rp "Save user and password to an unencrypted file to avoid writing? [y/N] " save
    if [ $save = y ]; then
        git config --global credential.helper "store"
    else
        git config --global credential.helper "cache --timeout 3600"
    fi
}

case "$1" in
    git)
        setup_git
        ;;
    all)
        setup_git
        ;;
    *)
        echo -e $"\nUsage: $(basename "$0") {git|all}\n"
        exit 1
        ;;
esac

success "Done."