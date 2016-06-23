# So that Vim doesn't hang when using Ctrl mappings.
stty -ixon

cd ~/Code

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

alias tail_api_log='tail -f ~/Code/api/storage/logs/lumen.log'
alias tail_dev_log='tail -f ~/Code/devx/files/logs/vault.log'
alias js_compile='npm run watch no-upload'

alias tmux="TERM=screen-256color-bce tmux"

alias my_proc='ps ux'
alias all_proc='ps ax'

force_color_prompt=yes

# Add git branch if its present to PS1
parse_git_branch() {
 git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
if [ "$color_prompt" = yes ]; then
 PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[01;31m\]$(parse_git_branch)\[\033[00m\]\$ '
else
 PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w$(parse_git_branch)\$ '
fi
unset color_prompt force_color_prompt
