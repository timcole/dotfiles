export ZSH=$HOME/.oh-my-zsh

# ZSH_THEME="agnoster"
ZSH_THEME="igeek-modest"

plugins=(
  git
  golang
  dotenv
  node
  sudo
)

source $ZSH/oh-my-zsh.sh

export EDITOR='nvim'

# Golang
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export GO111MODULE=on

export GEMPATH=$HOME/.gem/ruby/2.6.0
export PATH=$GOPATH/bin:$GOROOT/bin:$GEMPATH/bin:$PATH

# Load our aliases
source ~/.alias

# export TERM=xterm-256color

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export LC_ALL=en_US.UTF-8

export PATH="/Users/tim/bin/:$PATH"
export PATH="/usr/local/opt/node@14/bin:$PATH"
export PATH="/usr/local/opt/mysql-client/bin:$PATH"
