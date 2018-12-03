# So that Vim doesn't hang when using Ctrl mappings.
stty -ixon

alias ll='ls -lah'

#--------------------------------------------------
# Git aliases
#--------------------------------------------------
alias gs='git status'
alias ga='git add '
alias gc='git commit'
alias gd='git diff'
alias gpush='git push'
alias gpull='git pull'
alias gu='git checkout'
alias git-conflicts='git diff --name-only --diff-filter=U'

#--------------------------------------------------
# Command overrides
#--------------------------------------------------
alias tmux='tmux -u'
alias grepr="grep -rnI"

alias dce="docker-compose exec"

alias docker-stop-all='docker container stop $(docker container ls -q)'
