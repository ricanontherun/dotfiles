# So that Vim doesn't hang when using Ctrl mappings.
stty -ixon

alias ll='ls -lah'

#--------------------------------------------------
# Git aliases
#--------------------------------------------------
alias gs='git status'
alias ga='git add '
alias gaa='git add --all'
alias gc='git commit'
alias gcm='git commit -m '
alias gd='git diff'
alias gp='git push'
alias gg='git pull'
alias ggm='git pull origin master'
alias gu='git checkout'
alias gum='git checkout master'
alias gnb='git checkout -b'
alias conflicts='git diff --name-only --diff-filter=U'

#--------------------------------------------------
# Command overrides
#--------------------------------------------------
alias tmux='tmux -u'
alias grepr="grep -rnI"

alias dce="docker-compose exec"

alias docker-stop-all='docker container stop $(docker container ls -q)'
