# rbenvの参照先を変える
export PATH="~/.rbenv/shims:/usr/local/bin:$PATH"
eval "$(rbenv init -)"
export PATH=$PATH:/Users/kunitomo/dotfiles
# nodebrewのパスを通す（これがないとnodebrew useでバージョンを切り替えようとしても切り替わらない)
export PATH=$HOME/.nodebrew/current/bin:$PATH
export PATH=/opt/homebrew/var/nodebrew/current/bin:$PATH
# dotfiles配下のzshを参照する
export ZDOTDIR=${HOME}/dotfiles/zsh

export PATH="/usr/local/bin:$PATH"
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
export PATH=$PATH:/Users/k_kunitomo
export PATH="/opt/homebrew/bin/:$PATH"

# cdを指定せずにディレクトリ移動できる
setopt auto_cd
## 環境変数を補完
setopt AUTO_PARAM_KEYS
## 履歴保存管理
HISTFILE=$ZDOTDIR/.zsh-history
 # 履歴ファイルに時刻を記載
setopt extended_history
# 同一ホストで自分が動かしているすべてのzshのプロセスで履歴を共有
setopt share_history
HISTSIZE=100000
SAVEHIST=1000000
# 同一ホストで自分が動かしているすべてのzshのプロセスで履歴を共有
setopt share_history
# 重複を記録しない
setopt hist_ignore_dups
# ヒストリに追加されるコマンド行が古いものと同じなら古いものを削除
setopt hist_ignore_all_dups
## 環境変数を補完
setopt AUTO_PARAM_KEYS
# historyコマンドは履歴に登録しない
setopt hist_no_store
# 補完時にヒストリを自動的に展開
setopt hist_expand
# 履歴をインクリメンタルに追加
setopt inc_append_history



### alias ###

# zsh alias
alias sz='source ~/.zshrc'
alias nvz='nvim ~/zsh/config.zsh'
alias nv='nvim .'
alias v='vim .'


# Git alias
alias gs='git status'
alias ga='git add'
alias gc='git commit -m'
alias gpu='git push origin $(git rev-parse --abbrev-ref HEAD)'
alias gpl='git pull origin $(git rev-parse --abbrev-ref HEAD)'
alias gb='git branch'
alias gco='git checkout'
alias gsh='git stash'
alias gsha='git stash apply'
alias grh='git reset --hard HEAD^'
alias grlrh='git reset --hard HEAD@{1}'
alias gca='git commit --amend'


# Docker alias
alias dcu='docker-compose up'
alias dcp='docker-compose ps'
alias dcd='docker-compose down'
alias dewb='docker-compose exec web /bin/bash'
alias yarn-build='docker compose run --rm front sh -c "cd /myapp/frontend && yarn install && yarn build"'
alias dcrw='docker-compose run --rm --service-ports web'
alias dcrs='docker-compose run --rm --service-ports sidekiq'
alias dst='docker stop $(docker ps -q)'
alias dvpr='docker volume prune'
alias dipr='docker image prune'
alias dsypr='docker system prune'


alias vim-credentials='nvim /Users/k_kunitomo/.aws/credentials'

# peco
## コマンド履歴検索 Ctrl-R
function peco-history-selection() {
    BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
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
