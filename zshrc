# fzf binary (installed by .init.sh)
[[ -d $HOME/.fzf/bin ]] && export PATH="$HOME/.fzf/bin:$PATH"

# activate antidote
source ${ZDOTDIR:-~}/.antidote/antidote.zsh
antidote load ${ZDOTDIR:-~}/.zsh_plugins

# load pure
PURE_GIT_DOWN_ARROW="⇩"
PURE_GIT_UP_ARROW="⇧"

# bind up/down arrows to history substring search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey '^[OA' history-substring-search-up
bindkey '^[OB' history-substring-search-down

# speed up git completion in large repos
export GIT_COMPLETION_CHECKOUT_NO_GUESS=1
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

# After git completion lazy-loads, patch __git_complete_refs to only complete
# local branches (skips slow remote branch enumeration in large repos)
_patch_git_refs() {
    (( $+functions[__git_complete_refs] )) || return
    __git_complete_refs() {
        local remote="" dwim="" pfx="" cur_="$cur" sfx=" " mode="refs"
        while test $# != 0; do
            case "$1" in
                --remote=*) remote="${1##--remote=}" ;;
                --dwim)     dwim="yes" ;;
                --track)    dwim="yes" ;;
                --pfx=*)    pfx="${1##--pfx=}" ;;
                --cur=*)    cur_="${1##--cur=}" ;;
                --sfx=*)    sfx="${1##--sfx=}" ;;
                --mode=*)   mode="${1##--mode=}" ;;
                *)          return 1 ;;
            esac
            shift
        done
        # Replace "refs" (all refs including remotes) with "heads" (local only)
        [ "$mode" = "refs" ] && mode="heads"
        case "$mode" in
            heads)        __gitcomp_direct "$(__git_heads "$pfx" "$cur_" "$sfx")" ;;
            remote-heads) __gitcomp_direct "$(__git_remote_heads "$pfx" "$cur_" "$sfx")" ;;
            *)            return 1 ;;
        esac
    }
    compprefuncs=(${compprefuncs:#_patch_git_refs})
}
compprefuncs+=(_patch_git_refs)

if [ -e $HOME/.setup ]; then
  source $HOME/.setup
fi
if [ -e $HOME/.aliases ]; then
  source $HOME/.aliases
fi
if [ -e $HOME/.setup.local ]; then
  source $HOME/.setup.local
fi

# Set up base16 shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        source "$BASE16_SHELL/profile_helper.sh"

base16_eighties

# activate mcfly
eval "$(mcfly init zsh)"

# colored completions via LS_COLORS (Linux only — macOS sets this via .setup.local)
if command -v dircolors &>/dev/null; then
  eval "$(dircolors -b)"
fi
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

autoload -U compinit; compinit
