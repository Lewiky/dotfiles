# Path to your oh-my-zsh installation.
export ZSH="/Users/lewiky/.oh-my-zsh"

ZSH_THEME="agnoster"

# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

bindkey "^X\x7f" backward-kill-line
alias py=python3.7
alias pi=pip3.7

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/lewis.bell/Downloads/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/lewis.bell/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/lewis.bell/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/lewis.bell/Downloads/google-cloud-sdk/completion.zsh.inc'; fi


function gitgraph(){
  git log --decorate --oneline --graph
}

alias arduino='/Applications/Arduino.app/Contents/MacOS/Arduino'
alias pull='git pull' 
source ~/.z.sh
export GOPATH='/Users/lewiky/.go'
export EDITOR='vim'

# added by travis gem
[ -f /Users/lewiky/.travis/travis.sh ] && source /Users/lewiky/.travis/travis.sh

