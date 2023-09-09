alias memuse="ps -o rss,command -waxc | sort -n"

autoload -U compinit && compinit
zmodload -i zsh/complist

export PATH=/Library/Java/Home/bin:$PATH:$HOME/bin
export LESS=FRSXQ
export EDITOR=vim
export TERM=xterm-256color
export GIT_COMPLETION_NO_REMOTE_BRANCHES=1
export GIT_COMPLETION_NO_TAGS=1

prompt() {
  git rev-parse --is-inside-work-tree &>/dev/null
  if [ $? -eq 0 ]
  then
    branch_name="$(git symbolic-ref --quiet --short HEAD 2> /dev/null || \
                   git describe --all --exact-match HEAD 2> /dev/null || \
                   git rev-parse --short HEAD 2> /dev/null)"

    PS1="%{%F{white}%}patrick %{%F{yellow}%}in %{%F{red}%}$(basename `pwd`) %{%F{yellow}%}on %{%F{green}%}$branch_name %{%F{yellow}%}λ %{%f%}"
  else
    PS1="%{%F{white}%}patrick %{%F{yellow}%}in %{%F{red}%}$(basename `pwd`) %{%F{yellow}%}λ %{%f%}"
  fi
}
precmd() {
  prompt;
}

# Appends every command to the history file once it is executed
setopt inc_append_history
# Reloads the history whenever you use it
setopt share_history

alias hh=hstr
export HSTR_CONFIG=hicolor
export HOMEBREW_NO_ENV_HINTS=1
setopt histignorespace
bindkey -s "\C-r" "\C-a hstr -- \C-j"
bindkey -e
