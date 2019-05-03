# marksylee's zshrc
# =================
#
# Copyright (c) 2017 marksylee, and licensed under MIT:
# https://opensource.org/licenses/MIT.


# Basic Config
# ============

# this variable is for the theme
export DEFAULT_USER="marklee"

# default editor
export EDITOR="/usr/local/bin/nvim"

# enable zsh menu selection completion
zstyle ":completion:*" menu select

# ignore pyc files in completion
FIGNORE=.pyc

# emacs mode as default
set -o emacs

# enable in-line comment
setopt interactivecomments

# MacOS cannot use dircolors, so replace with this solarized-like color settings
if [ "$(uname)" = "Darwin" ]; then
    export CLICOLOR=1
    export LSCOLORS=GxFxCxDxBxegedabagaced
fi


# Zplug Config
# ============

# set zplug path here
export ZPLUG_HOME=~/.zplug

# init zplug
source $ZPLUG_HOME/init.zsh


# pyenv Config
# ============

# check pyenv and init with virtualenv
if which pyenv > /dev/null; then
    export PYENV_VIRTUALENV_DISABLE_PROMPT=1
    eval "$(pyenv init -)"
    # eval "$(pyenv virtualenv-init -)"
fi


# Reset All Locales
# =================
export LANG="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"


# Plugins
# =======

zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# theme
zplug "agnoster/agnoster-zsh-theme", use:agnoster.zsh-theme, from:github, as:theme

# oh-my-zsh
zplug "lib/history", from:oh-my-zsh
zplug "lib/completion", from:oh-my-zsh
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/fancy-ctrl-z", from:oh-my-zsh

# tmux
zplug "modules/tmux", from:prezto
# vim color issue when used from tmux
export TERM=xterm-256color

# fancy git-diff
zplug "so-fancy/diff-so-fancy", as:command, use:"diff-so-fancy"

# number shortcut
zplug "ndbroadbent/scm_breeze", hook-build:"$ZPLUG_HOME/repos/ndbroadbent/scm_breeze/install.sh"
[ -s "$HOME/.scm_breeze/scm_breeze.sh" ] && source "$HOME/.scm_breeze/scm_breeze.sh"
# add `nvim` to `scmb_wrapped_shell_command` in `~/.git.scmbrc` if need neovim support

# fuzzy Search
zplug "junegunn/fzf-bin", from:gh-r, as:command, rename-to:fzf
zplug "junegunn/fzf", as:command, use:"bin/fzf-tmux", hook-build:"$ZPLUG_HOME/repos/junegunn/fzf/install --all"
zplug "marksylee/f9b9a262053566594ed378652f786136", from:gist, as:command, use:fzf-git-browse.sh
export FZF_DEFAULT_OPTS="
  --reverse
  --color fg:-1,bg:-1,hl:33,fg+:254,bg+:235,hl+:33
  --color info:136,prompt:136,pointer:230,marker:230,spinner:136
"
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -l -g ""'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# fancy zsh
zplug "zsh-users/zsh-history-substring-search"
bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down
zplug "zsh-users/zsh-syntax-highlighting", defer:2, hook-load:"ZSH_HIGHLIGHT_STYLES[comment]=fg=blue,dim"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions", hook-load:"ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE=fg=242"
zplug "rupa/z", use:z.sh
zplug "joel-porquet/zsh-dircolors-solarized", hook-load:"source $ZPLUG_HOME/repos/joel-porquet/zsh-dircolors-solarized/zsh-dircolors-solarized.zsh", if:"(( $+commands[dircolors] ))"


# zplug check, install and load
# =============================
# if ! zplug check; then
#     printf "Install? [y/N]: "
#     if read -q; then
#         echo; zplug install
#     fi
# fi

zplug load  # --verbose


# Alias
# =====
alias '?'='which'
alias cls='clear'
alias l='ll'
alias grep='grep --color'
alias cd='exec_scmb_expand_args builtin cd'

# Git
alias gap='git add --patch'

# Python
alias py='py2'
alias py2='python2'
alias py3='python3'
alias ipy='ipython'
alias ipyn='ipython notebook'

# fzf
alias fzf-tmux='fzf-tmux -d 30%'
alias gl='fzf-git-browse.sh'  # it's awesome!

# Vim
alias nvim='exec_scmb_expand_args $EDITOR'
alias vim='nvim'
alias vi='vim'

# tmux
alias tma='tmux a'
alias tmk='tmux kill-session'

# tree
alias tree='tree -I "__pycache__|*.pyc"'


# Function
# ========
vif() {
    local files
    IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0))
    [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
}

gbf() {
    local file
    file=($(fzf-tmux --query="$1" --select-1 --exit-0))
    [[ -n "$file" ]] && git blame "${file}"
}

unalias z 2> /dev/null
z() {
    [ $# -gt 0 ] && _z "$*" && return
    local file
    file=($(_z -l 2>&1 | fzf-tmux --nth 2.. --reverse --inline-info +s --tac --query "${*##-* }" | sed 's/^[0-9,.]* *//'))
    [[ -n "$file" ]] && cd "$file"
}


# Enhanced Manual
# ===============
export PAGER="`which less` -s"
export BROWSER="$PAGER"
export LESS_TERMCAP_mb=$'\E[0;34m'
export LESS_TERMCAP_md=$'\E[0;34m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
#export LESS_TERMCAP_so=$'\E[38;5;167m'
export LESS_TERMCAP_so=$'\E[0;34m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[0;33m'
