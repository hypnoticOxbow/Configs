#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"
PS1='[\u@\h \W]\$ '
