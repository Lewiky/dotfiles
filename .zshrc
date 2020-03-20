# Path to your oh-my-zsh installation.
export ZSH="/Users/lewiky/.oh-my-zsh"

ZSH_THEME="agnoster"

# Add wisely, as too many plugins slow down shell startup.
plugins=(git vi-mode docker zsh-autosuggestions zsh-syntax-highlighting)

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

function minikubers(){
  minikube delete
  minikube start --vm-driver=virtualbox
  kubectl create secret docker-registry regcred --docker-server=registry.lewiky.com --docker-username=temple --docker-password=Lim0ncell0 --docker-email=lewisbell999@gmail.com
  kubectl create -f kube
}

function kexec(){
  kubectl exec -it "$1" -- sh
}


alias arduino='/Applications/Arduino.app/Contents/MacOS/Arduino'
alias pull='git pull' 
alias k='kubectl'
alias kg='kubectl get'
alias kd='kubectl describe'
alias kgp='kubectl get pod'
alias kdp='kubectl describe pod'
source ~/.z.sh
export GOPATH='/Users/lewiky/.go'
export EDITOR='vim'

# added by travis gem
[ -f /Users/lewiky/.travis/travis.sh ] && source /Users/lewiky/.travis/travis.sh
prompt_context(){} 

eval $(thefuck --alias)
