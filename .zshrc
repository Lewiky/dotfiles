bindkey "^X\x7f" backward-kill-line
alias py=python3.7
alias pi=pip3.7

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/lewis.bell/Downloads/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/lewis.bell/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/lewis.bell/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/lewis.bell/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
