source /apollo/env/envImprovement/var/zshrc
export PATH="$PATH:/apollo/env/eclipse-4.2/bin:/apollo/env/envImprovement/bin"
#
# .zshrc is sourced in interactive shells.
# It should contain commands to set up aliases,
# functions, options, key bindings, etc.
#

ZSH_THEME="miloshadzic"
ZSH=/home/dppeppel/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

autoload -U compinit
compinit

#allow tab completion in the middle of a word
setopt COMPLETE_IN_WORD

#aliases
alias bb="brazil-build"
alias fcdb="sh ~/whidDBFind.sh"
alias ccserver="bb clean && bb apollo-pkg && sudo runCommand -e AFTCommandCenterWebsite -a Activate"
alias ccdev="bb clean && bb apollo-pkg && brazil-runtime-exec manage.py runserver dppeppel.desktop.amazon.com:3040"
alias barkp="bark -ConfigFile=/home/dppeppel/.barkPROD"
alias barkd="bark -COnfigFile=/home/dppeppel/.barkDEV"
alias gits="git status"
alias gitc="git commit"

#make term 256 colors
export TERM=xterm-256color

## keep background processes at full speed
#setopt NOBGNICE
## restart running processes on exit
#setopt HUP

## history
#setopt APPEND_HISTORY
## for sharing history between zsh processes
#setopt INC_APPEND_HISTORY
#setopt SHARE_HISTORY

## never ever beep ever
#setopt NO_BEEP

## automatically decide when to page a list of completions
#LISTMAX=0

## disable mail checking
#MAILCHECK=0

# autoload -U colors
#colors
