source "$HOME/.git-completion"

alias memuse="ps -o rss,command -waxc | sort -n"

export LESS=FRSXQ
export EDITOR=vim
export TERM=xterm-256color
export JAVA_HOME=/Library/Java/Home

conditional_git_prompt() {
  git rev-parse --is-inside-work-tree &>/dev/null
  if [ $? -eq 0 ]
  then
    branch_name="$(git symbolic-ref --quiet --short HEAD 2> /dev/null || \
                   git describe --all --exact-match HEAD 2> /dev/null || \
                   git rev-parse --short HEAD 2> /dev/null)"

    echo "\[\033[1;37m\]in \[\033[1;31m\]$(basename `pwd`) \[\033[1;37m\]on \[\033[1;31m\]$branch_name"
  else
    echo "\[\033[1;37m\]in \[\033[1;31m\]$(basename `pwd`)"
  fi
}

bind -x '"\C-r": "HISTFILE=~/.bash_history.global hh"'
PROMPT_COMMAND='history -a ~/.bash_history.global; PS1="\[\033[1;34m\]patrick $(conditional_git_prompt) \[\033[1;33m\]λ\[\033[0m\] "'
