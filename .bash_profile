source "/Users/patrickgombert/.git-completion"

export EDITOR=vim

export PROMPT_COMMAND='history -a'

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

PROMPT_COMMAND='PS1="\[\033[1;34m\]patrick $(conditional_git_prompt) \[\033[1;33m\]λ\[\033[0m\] "'
