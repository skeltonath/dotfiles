# set up pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# activate antidote
source ${ZDOTDIR:-~}/.antidote/antidote.zsh
antidote load ${ZDOTDIR:-~}/.zsh_plugins

# load pure
PURE_GIT_DOWN_ARROW="⇩"
PURE_GIT_UP_ARROW="⇧"

# Set up base16 shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        source "$BASE16_SHELL/profile_helper.sh"
        
base16_eighties

# Aliases
alias gits="git status"
alias gitc="git commit -a -m"
alias gith="git checkout"
alias gitm="git checkout master"
