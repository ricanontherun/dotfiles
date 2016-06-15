# So that Vim doesn't hang when using Ctrl mappings.
stty -ixon

cd ~/Code

# Git aliases
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
alias conflicts='git diff --name-only --diff-filter=U'

alias tail_api_log='tail -f ~/Code/api/storage/logs/lumen.log'
alias tail_dev_log='tail -f ~/Code/devx/files/logs/vault.log'
alias js_compile='npm run watch no-upload'

alias tmux="TERM=screen-256color-bce tmux"

alias my_proc='ps ux'
alias all_proc='ps ax'
