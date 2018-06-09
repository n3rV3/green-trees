#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export LC_CTYPE='en_US.UTF-8'

alias ls='ls --color=auto '
alias cp='cp -i '
alias rm='rm -i '
# PS1='[\u@\h \W]\$ '

set -o vi

[[ -f /usr/share/git/completion/git-prompt.sh ]] && ln -sf /usr/share/git/completion/git-prompt.sh ~/.git-prompt.bash
[[ -f /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-prompt.sh ]] && \
    ln -sf /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-prompt.sh ~/.git-prompt.bash

if [[ $(uname) == 'Darwin' ]];then
    [[ -f $(brew --prefix)/etc/bash_completion ]] && source $(brew --prefix)/etc/bash_completion
    VIRTUALENVWRAPPER_PYTHON=/usr/local/opt/python/bin/python3.6
    VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
    source /usr/local/bin/virtualenvwrapper.sh
    BLUE="\[$(tput setaf 63)\]"
    GREEN="\[$(tput setaf 82)\]"
    RESET="\[$(tput sgr0)\]"
else
    BLUE="\[$(tput setaf 51)\]"
    GREEN="\[$(tput setaf 82)\]"
    RESET="\[$(tput sgr0)\]"
fi

. ~/.git-prompt.bash

GIT_PS1_SHOWDIRTYSTATE=true
# Show uncommited files/dirs too
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUPSTREAM=verbose
PS1_OUTPUT='$(__git_ps1 "(%s)")'
export PS1="${BLUE}[\u@\h \W]${RESET} ${GREEN}${PS1_OUTPUT}${RESET}${BLUE}\$${RESET} "

export HISTSIZE=500000000
export HISTFILESIZE=1000000000
export HISTTIMEFORMAT="%Y%m%d %T -- "

[ -d /usr/local/Cellar/coreutils/8.29/libexec/gnubin/ ] && export PATH="/usr/local/Cellar/coreutils/8.29/libexec/gnubin/:$PATH"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
[[ -f /usr/bin/virtualenvwrapper.sh ]] && source /usr/bin/virtualenvwrapper.sh

# Vagrant security, disable vm based symlink creation on shared folders
export VAGRANT_DISABLE_VBOXSYMLINKCREATE=1

export PATH=$PATH:/home/gurpreet/bin

[[ -f /home/gurpreet/lib/azure-cli/az.completion ]] && source /home/gurpreet/lib/azure-cli/az.completion

alias adobevpn='openconnect -u gurpsing --passwd-on-stdin asa-noida-1.adobe.com'

ssh-add ~/.ssh/adobe_id_rsa
genpasswd() {
    local l=$1
    [ "$l" == "" ] && l=16
    tr -dc A-Za-z0-9_\# < /dev/urandom | head -c ${l} | xargs
}


# Update PATH for new sqlite in Mac
[[ -d /usr/local/opt/sqlite/bin ]] && export PATH="/usr/local/opt/sqlite/bin:$PATH"

# set dircolors
[[ -d ~/Documents/github/dircolors-solarized ]] && eval `dircolors ~/Documents/github/dircolors-solarized/dircolors.256dark`

# For compilers to find this software you may need to set:
# export LDFLAGS=-L/usr/local/opt/sqlite/lib
# export CPPFLAGS=-I/usr/local/opt/sqlite/include
# For pkg-config to find this software you may need to set:
# export PKG_CONFIG_PATH=/usr/local/opt/sqlite/lib/pkgconfig
