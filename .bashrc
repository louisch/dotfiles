#
# ~/.bashrc
#

source "${HOME}/.bash_profile"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

source "${HOME}/.aliases"

PS1='[\u@\h \W]\$ '
