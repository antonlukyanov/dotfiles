export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

TERM=xterm-256color

if [[ "$IS_MACOS" == true ]]; then
    PATH=/usr/local/bin:/usr/local/sbin:$PATH
    PATH=$PATH:$HOME/bin
    PATH=$PATH:$HOME/bin/node_modules/.bin
    export PATH

    export HOMEBREW_NO_ANALYTICS=1
fi

# So that libraries lying in the same folder with executable could be found.
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./
export LD_LIBRARY_PATH

# Preferred editor for remote and local sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
else
    export EDITOR='subl'
fi

if [[ "$IS_LINUX" == true ]]; then
    export SHELL='/usr/bin/zsh'
fi

zlocal="$HOME/.zshenv-local"
if [ -f $zlocal ]; then
    source $zlocal
fi
