export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="agnoster"

plugins=(
  git
  golang
  dotenv
  node
  sudo
)

source $ZSH/oh-my-zsh.sh

export EDITOR='vim'

# Golang
export GOROOT=/usr/local/go
export GOPATH=$HOME/go

export GEMPATH=$HOME/.gem/ruby/2.6.0
export PATH=$GOPATH/bin:$GOROOT/bin:$GEMPATH/bin:$PATH

export NVM_DIR="${XDG_CONFIG_HOME/:-$HOME/.}nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# Bat > Cat -- https://github.com/sharkdp/bat
alias cat="bat --theme TwoDark"
# Remove all docker containers
alias dk="docker ps -a | grep Exit | cut -d ' ' -f 1 | xargs docker rm"

# Open popouts of different sites used often
alias twitch-dashboard="nohup google-chrome-stable --app=https://www.twitch.tv/modesttim/dashboard/live &"
alias twitter="nohup google-chrome-stable --app=https://tweetdeck.twitter.com/ &"
alias streamlabs="nohup google-chrome-stable --app=https://streamlabs.com/dashboard/recent-events &"

# Load our secret env vars
source ~/.zsh_secrets

# added by travis gem
[ -f /home/tim/.travis/travis.sh ] && source /home/tim/.travis/travis.sh
