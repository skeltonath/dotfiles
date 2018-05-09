# activate virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

# activate antigen
source $HOME/dotfiles/antigen.zsh

# load oh-mh-zsh libs
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle command-not-found
antigen bundle mafredri/zsh-async
antigen bundle skeltonath/pure
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting

# Tell Antigen that you're done.
antigen apply

# Pure prompt settings
PURE_GIT_DOWN_ARROW="⇩"
PURE_GIT_UP_ARROW="⇧"

# Set up base16 shell
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

# Aliases
alias gits="git status"
alias gitc="git commit -a -m"
alias gith="git checkout"
alias gitm="git checkout master"
