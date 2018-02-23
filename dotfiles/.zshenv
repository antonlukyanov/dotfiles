export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

TERM=xterm-256color

PATH=/usr/local/bin:/usr/local/sbin:$PATH
PATH=$PATH:$HOME/bin
PATH=$PATH:$HOME/bin/node_modules/.bin
PATH=$PATH:$HOME/Library/Android/sdk/platform-tools
export PATH

PYTHONPATH=$HOME/Development/current/pamela/utils
PYTHONPATH=$PYTHONPATH:$HOME/Development/current/devenv/share
export PYTHONPATH

export HOMEBREW_NO_ANALYTICS=1

# Preferred editor for remote and local sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
else
    export EDITOR='subl'
fi

zlocal="$HOME/.zshenv-local"
if [ -f $zlocal ]; then
    source $zlocal
fi
