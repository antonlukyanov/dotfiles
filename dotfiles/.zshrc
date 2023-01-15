OS=$(uname)
IS_MACOS=false
IS_LINUX=false

if [[ "${OS}" == "Darwin" ]]; then
    IS_MACOS=true
elif [[ "${OS}" == "Linux" ]]; then
    IS_LINUX=true
fi

#
# zsh configuration
#

ZSH=$HOME/.oh-my-zsh

# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# avit and ys theme are also good ones.
ZSH_THEME="antonlukyanov_dark"
CASE_SENSITIVE="false"
DISABLE_AUTO_UPDATE="false"
export UPDATE_ZSH_DAYS=7
DISABLE_LS_COLORS="false"
DISABLE_AUTO_TITLE="false"
DISABLE_CORRECTION="false"
COMPLETION_WAITING_DOTS="false"
HIST_STAMPS="dd/mm/yyyy"
plugins=(sudo python mercurial)

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

alias updrc='source $HOME/.zshrc'
alias zshrc='$EDITOR $HOME/.zshrc'
alias sshconfig='$EDITOR $HOME/.ssh/config'

alias where='which'
alias sz='du -h -d 0'

alias jnb='jupyter notebook'

alias yaml2js="python3 -c 'import sys, yaml, json; json.dump(yaml.load(sys.stdin), sys.stdout, indent=4)'"

#
# Only for OSX
#

if [[ "$IS_MACOS" == true ]]; then
    alias bi='brew install'
    alias bs='brew search'
    alias bl='brew list'
    alias bo='brew options'
    alias bu='brew update'
    alias fo='open -a Finder .'
    alias ftp.start='sudo -s launchctl load -w /System/Library/LaunchDaemons/ftp.plist'
    alias ftp.stop='sudo -s launchctl unload -w /System/Library/LaunchDaemons/ftp.plist'
    alias st='open -a SourceTree'

    #
    # PostgreSQL
    #

    alias pg.start='pg_ctl -D /usr/local/var/postgres start'
    alias pg.stop='pg_ctl -D /usr/local/var/postgres stop'

    #
    # Miscellaneous
    #

    alias flushdns='sudo killall -HUP mDNSResponder'

    ssdtot() {
        smartctl -l devstat /dev/disk0 | grep -i 'sectors wri' | awk '{ print $4/2097152 }'
    }
fi

#
# Only for Linux
#

if [[ "$IS_LINUX" == true ]]; then
    alias changefnmode='sudo bash -c "echo 2 > /sys/module/hid_apple/parameters/fnmode"'
fi

#
# Hledger
#

alias m='hledger'
alias bal='m bal'
alias bal.tm='m bal -p "this month"'
alias bal.exp='m bal Расходы'
alias bal.exp.tm='m bal Расходы -p "this month"'
alias bal.exp.lm='m bal Расходы -p "last month"'
alias bal.inc='m bal Доходы'
alias bal.inc.tm='m bal Доходы -p "this month"'
alias bal.inc.lm='m bal Доходы -p "last month"'
alias reg='m reg'
alias reg.exp='m reg Расходы'
alias reg.exp.tm='reg.exp -p "this month"'
alias reg.exp.lm='reg.exp -p "last month"'
alias reg.inc.tm='m reg Доходы -p "this month"'
alias reg.inc.lm='m reg Доходы -p "last month"'
alias acc='m acc --tree'
alias m.exp.monthly='bal --tree -p "$(date +'%Y/%m')/01..$(date -v+1m +'%Y/%m')" --monthly Расходы --average'
alias m.exp.monthly3='bal --tree -p "$(date -v-2m +'%Y/%m')..$(date +'%Y/%m/%d')" --monthly Расходы --average'
alias m.exp.monthly12='bal --tree -p "$(date -v-11m +'%Y/%m')..$(date +'%Y/%m/%d')" --monthly Расходы --average'
alias m.inc.monthly="bal --tree -p $(date +'%Y') --monthly Доходы --average"
alias m.inc.monthly3='bal --tree -p "$(date -v-2m +'%Y/%m')..$(date -v+1m +'%Y/%m')" --monthly Доходы --average'
alias m.inc.monthly12='bal --tree -p "$(date -v-11m +'%Y/%m')..$(date -v+1m +'%Y/%m/%d')" --monthly Доходы --average'
alias m.activity='m activity --monthly'

#
# FFmpeg
#

alias cvt.toalac='for f in *.flac; do ffmpeg -i "$f"  -vf "crop=((in_w/2)*2):((in_h/2)*2)" -c:a alac "${f%.flac}.m4a"; done'
alias cvt.mkv2mp4='for f in *.flac; do ffmpeg -i "$f" -codec copy "${f%.*}.mp4"; done'

#
# Docker
#

alias d.ps='docker ps --format "table {{.ID}}\t{{.Names}}\t{{.Image}}\t{{.Status}}"'
alias d.ex='docker exec -e COLUMNS="`tput cols`" -e LINES="`tput lines`" -it'

# git_repo_delete ysu-mf/gui-a2-colorpicker-kondratevsergey
function git_repo_delete(){
  curl -vL \
    -H "Authorization: token $GITHUB_SECRET" \
    -H "Content-Type: application/json" \
    -H "Accept: application/vnd.github.v3+json" \
    -X DELETE "https://api.github.com/repos/$1"
}

# Don't forget to specify token.
# git_repo_list orgs/ysu-mf 1
function git_repo_list(){
  curl -L \
    -H "Authorization: token $GITHUB_SECRET" \
    -H "Content-Type: application/json" \
    -H "Accept: application/vnd.github.v3+json" \
    "https://api.github.com/$1/repos?per_page=100&page=$2"
}

zrclocal="$HOME/.zshrc-local"
if [ -f $zrclocal ]; then source $zrclocal; fi

zenv="$HOME/.zshenv"
if [ -f $zenv ]; then source $zenv; fi
