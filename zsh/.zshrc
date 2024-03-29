export ZSH=$HOME/.oh-my-zsh
export HISTSIZE=100000
export SAVEHIST=100000

# ZSH_THEME="agnoster"
ZSH_THEME="igeek-modest"

plugins=(
  git
  dotenv
  node
  sudo
)

export ZSH_DOTENV_PROMPT='false'

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
export GPG_TTY=$(tty)

export PATH="/Users/tim/bin/:$PATH"
export PATH="/usr/local/opt/node@14/bin:$PATH"
export PATH="/usr/local/opt/mysql-client/bin:$PATH"
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# bun completions
[ -s "/Users/tim/.bun/_bun" ] && source "/Users/tim/.bun/_bun"

# bun
export BUN_INSTALL="/Users/tim/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

eval "$(fnm env --use-on-cd)"
eval "$(op completion zsh)"; compdef _op op

autoload -U compinit && compinit

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/tim/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/tim/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/tim/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/tim/google-cloud-sdk/completion.zsh.inc'; fi
