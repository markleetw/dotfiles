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
export EDITOR="nvim"

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
    export CLICOLOR="true"
    export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD
fi


# Zplug Config
# ============

# set zplug path here
export ZPLUG_HOME=/usr/local/opt/zplug

# init zplug
source $ZPLUG_HOME/init.zsh


# pyenv Config
# ============

# check pyenv and init with virtualenv
if which pyenv > /dev/null; then
    export PYENV_VIRTUALENV_DISABLE_PROMPT=1
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
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
export scmb_wrapped_shell_commands="$scmb_wrapped_shell_commands nvim"

# fuzzy Search
zplug "junegunn/fzf-bin", from:gh-r, as:command, rename-to:fzf
zplug "junegunn/fzf", as:command, use:"bin/fzf-tmux", hook-build:"$ZPLUG_HOME/repos/junegunn/fzf/install --all"
zplug "marksylee/f9b9a262053566594ed378652f786136", from:gist, as:command, use:fzf-git-browse.sh
export FZF_DEFAULT_OPTS="
  --reverse
  --color fg:-1,bg:-1,hl:33,fg+:254,bg+:235,hl+:33
  --color info:136,prompt:136,pointer:230,marker:230,spinner:136
"
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
if ! zplug check; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load  # --verbose


# Alias
# =====
alias '?'='which'
alias cls='clear'
alias l='ll'

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
alias vim='nvim'
alias vi='vim'
alias vif='vim $(fzf-tmux -m)'

# tmux
alias tma='tmux a'
alias tmk='tmux kill-session'
