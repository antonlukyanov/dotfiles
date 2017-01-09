#
# zsh configuration
#

ZSH=$HOME/.oh-my-zsh

# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# avit and ys theme are also good ones.
ZSH_THEME="antonlukyanov"
CASE_SENSITIVE="false"
DISABLE_AUTO_UPDATE="false"
export UPDATE_ZSH_DAYS=7
DISABLE_LS_COLORS="false"
DISABLE_AUTO_TITLE="false"
DISABLE_CORRECTION="false"
COMPLETION_WAITING_DOTS="false"
HIST_STAMPS="dd/mm/yyyy"
plugins=(sudo python git mercurial)

source $ZSH/oh-my-zsh.sh

#
# User configuration
#

# Filtering ls output using grep.
# For example: lg '\.(php|xml)$' prints filenames with .php and .xml extensions.
alias lg='ls -aolA | grep -iE'

# mktar arch.tar.gz folder/
alias mktar='tar -czvf'
alias untar='tar -xzvf'
alias ungz='gzip -dv'

alias updrc='source $HOME/.zshrc; source $HOME/.zshenv'
alias zshrc='$EDITOR $HOME/.zshrc'

alias where='which'
alias sz='du -h -d 0'

alias jnb='jupyter notebook'

# Only for OSX.
if [[ $(uname) == "Darwin" ]]; then
    alias bi='brew install'
    alias bs='brew search'
    alias bl='brew list'
    alias bo='brew options'
    alias bu='brew update'
    alias f='open -a Finder .'
    alias ftp.start='sudo -s launchctl load -w /System/Library/LaunchDaemons/ftp.plist'
    alias ftp.stop='sudo -s launchctl unload -w /System/Library/LaunchDaemons/ftp.plist'
fi

alias m='hledger'
alias bal='m bal'
alias bal.tm='m bal -p "this month"'
alias bal.exp.tm='m bal Расходы -p "this month"'
alias reg='m reg'
alias reg.exp='m reg Расходы'
alias reg.exp.tm='reg.exp -p "this month"'
alias reg.exp.lm='reg.exp -p "last month"'
alias acc='m acc --tree'
alias m.monthly='m balance --tree --monthly Расходы'
alias m.activity='m activity --monthly'

ssdtot() {
    smartctl -l devstat /dev/disk0 | grep -i 'sectors wri' | awk '{ print $4/2097152 }'
}

if [ -f ~/.devenv ]; then source ~/.devenv; fi
