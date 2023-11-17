# rbenvの参照先を変える
export PATH="~/.rbenv/shims:/usr/local/bin:$PATH"
eval "$(rbenv init -)"
export PATH=$PATH:/Users/kunitomo/dotfiles

# dotfiles配下のzshを参照する
export ZDOTDIR=${HOME}/dotfiles/zsh

# cdを指定せずにディレクトリ移動できる
setopt auto_cd

## 環境変数を補完
setopt AUTO_PARAM_KEYS

## 履歴保存管理
HISTFILE=$ZDOTDIR/.zsh-history
HISTSIZE=100000
SAVEHIST=1000000


### alias ###

# zsh alias
alias sz='source ~/.zshrc'
alias vz='nvim ~/.zshrc'
alias v='nvim .'

# Git alias
alias gs='git status'
alias ga='git add'
alias gc='git commit -m'
alias gpu='git push origin $(git rev-parse --abbrev-ref HEAD)'
alias gpl='git pull origin $(git rev-parse --abbrev-ref HEAD)'

# Docker alias
alias dcu='docker-compose up'
alias dcp='docker-compose ps'
alias dcd='docker-compose down'
