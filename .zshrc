# rbenvの参照先を変える
export PATH="~/.rbenv/shims:/usr/local/bin:$PATH"
eval "$(rbenv init -)"
export PATH=$PATH:/Users/kunitomo/dotfiles 

export ZDOTDIR=${HOME}/dotfiles/zsh

### alias ###

# zsh alias
alias sz='source ~/.zshrc'
alias vz='vim ~/.zshrc'
alias v='nvim .'

# Git alias
alias gs='git status -sb'
alias ga='git add'
alias gc='git commit -m'
alias gpu='git push origin $(git rev-parse --abbrev-ref HEAD)'
alias gpl='git pull origin $(git rev-parse --abbrev-ref HEAD)'

# Docker alias
alias dcu='docker-compose up'
alias dcp='docker-compose ps'
alias dcd='docker-compose down'


# cdを指定せずにディレクトリ移動できる
setopt auto_cd
