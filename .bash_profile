export PS1="\W\\$ "
set -o vi
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
#export GSOURCE_DIR=/Users/eric/gccLab/gcc-4.6.2/gcc
alias l="pwd; ls -alh -tr"
alias ll="pwd; ls -alh -tr"

pp() { 
    if [ $@ ]; then 
        cd "$@"; 
        if [ $? -eq 0 ]; then
            pushd .;
        fi
    else
        pushd .;
    fi
    }
alias p="popd"

alias u="cd ..; pwd"
alias mls="mdfind -onlyin . -name"
alias mfind="mdfind -onlyin ."
alias v="mvim"

g() { grep -r -n "$@" . ;}
pman() { man -t "${1}" | open -f -a /Applications/Preview.app; }
export EDITOR='mvim -f'

source ~/git-completion.bash

# Setting PATH for Python 3.3
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.3/bin:${PATH}"
export PATH

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export PATH=/Users/tornado/p/jruby-1.7.8/bin:$PATH

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"


# MacPorts Installer addition on 2013-03-06_at_00:32:05: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

