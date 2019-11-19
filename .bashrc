#
# ~/.bashrc
#

source "${HOME}/.bash_profile"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

source "${HOME}/.aliases"

# Set up Node Version Manager
#source /usr/share/nvm/init-nvm.sh

## Main mechanism for managing dot files
## https://atlassian.com/git/tutorials/dotfiles
alias config='/usr/bin/git --git-dir="$HOME/.cfg/" --work-tree="$HOME"'
