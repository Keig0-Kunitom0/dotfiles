# rbenvの参照先を変える
export PATH="~/.rbenv/shims:/usr/local/bin:$PATH"
eval "$(rbenv init -)"
export PATH=$PATH:/Users/kunitomo/dotfiles

# nodebrewのパスを通す（これがないとnodebrew useでバージョンを切り替えようとしても切り替わらない)
export PATH=$HOME/.nodebrew/current/bin:$PATH
export PATH=/opt/homebrew/var/nodebrew/current/bin:$PATH

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

## 環境変数を補完
setopt AUTO_PARAM_KEYS


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


# peco
## コマンド履歴検索 Ctrl-R
function peco-history-selection() {
  BUFFER=`history -n 1 | tac  | awk '!a[$0]++' | peco`
  CURSOR=$#BUFFER
  zle reset-prompt
}
zle -N peco-history-selection
bindkey '^R' peco-history-selection

## コマンド履歴からディレクトリ検索・移動 Ctrl-E
if [[ -n $(echo ${^fpath}/chpwd_recent_dirs(N)) && -n $(echo ${^fpath}/cdr(N)) ]]; then
  autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
  add-zsh-hook chpwd chpwd_recent_dirs
  zstyle ':completion:*' recent-dirs-insert both
  zstyle ':chpwd:*' recent-dirs-default true
  zstyle ':chpwd:*' recent-dirs-max 1000
  zstyle ':chpwd:*' recent-dirs-file "$HOME/.cache/chpwd-recent-dirs"
fi
function peco-cdr () {
  local selected_dir="$(cdr -l | sed 's/^[0-9]* *//' | peco)"
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
}
zle -N peco-cdr
bindkey '^W' peco-cdr

## カレントディレクトリ以下のディレクトリ検索・移動 Ctrl-X
function find_cd() {
  local selected_dir=$(find . -type d | peco)
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
}
zle -N find_cd
bindkey '^X' find_cd
