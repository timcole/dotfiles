export ZSH=$HOME/.oh-my-zsh

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
alias vim="nvim"

# Golang
# export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export GO111MODULE=on

export GEMPATH=$HOME/.gem/ruby/2.6.0
export PATH=$GOPATH/bin:$GOROOT/bin:$GEMPATH/bin:$PATH

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion

# Bat > Cat -- https://github.com/sharkdp/bat
alias cat="bat --theme TwoDark"

# Remove all docker containers
alias dk="docker ps -a | grep Exit | cut -d ' ' -f 1 | xargs docker rm"

# Load our secret env vars
source ~/.zsh_secrets

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export LC_ALL=en_US.UTF-8
