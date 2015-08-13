# ~/.config/fish/config.fish

alias g='git'

alias ga='git add'

alias gb='git branch'
alias gba='git branch -a'
alias gbl='git blame'
alias gbs='git bisect'

alias gc='git commit'
alias gca='git commit --amend'
alias gcb='git checkout -b'
alias gcd='git checkout develop'
alias gcl='git clone'
alias gcm='git checkout master'
alias gco='git checkout'
alias gcp='git cherry-pick'

alias gd='git diff'
alias gdca='git diff --cached'

alias gf='git fetch'

alias gp='git push'

alias grhh='git reset --hard HEAD'

alias gs='git stash'
alias gsa='git stash apply'
alias gsl='git stash list'
alias gsp='git stash pop'
alias gst='git status'

# disable shell welcome message
set fish_greeting ''
