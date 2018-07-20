# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="robbyrussell" # fwalch lambda
ZSH_THEME="fwalch"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(gitfast osx rails rake-fast fasd z)
plugins=(gitfast osx rails rake-fast bundler fasd)

# User configuration

# export PATH="$HOME/npm-global/bin:$HOME/.rbenv/bin:/Library/Frameworks/Python.framework/Versions/3.3/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/git/bin:/usr/texbin:$HOME/go/bin"

export PATH="$HOME/npm-global/bin:$HOME/.rbenv/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/git/bin:/usr/texbin:$HOME/go/bin:$HOME/my_bins"

# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

setopt no_auto_remove_slash
ben_rsync() { rsync -rvC ${1} ben:kano/current/${1}; }
ben_async_restart() { (cap staging deploy:precompile_assets && cap staging unicorn:reload && cap staging sidekiq:restart) & rsync -rvC ${1} ben:kano/current/${1}; }
ben_restart() { cap staging unicorn:restart }

eval "$(fasd --init auto)"
alias l="pwd; ls -alh -tr"
alias ll="pwd; ls -alh -tr"
alias u="cd ..; pwd"
alias mls="mdfind -onlyin . -name"
alias mfind="mdfind -onlyin ."
alias v="mvim"
alias b='bundle exec'
alias bb='./bin/bundle exec'
alias gd='git difftool'
alias gdc='git difftool --cached'
alias gs='git status -u'
alias gk='g_dsf'
alias rgc='rails generate controller'
alias mt='mix test'
alias bfg='java -jar $HOME/my_bins/bfg-1.13.0.jar'
g_dsf() {
  git diff --color "$@" | diff-so-fancy | less --tabs=1,5 -RFX
}
gkc() {
  git diff --color --cached "$@" | diff-so-fancy | less --tabs=1,5 -RFX
}

eval "$(rbenv init -)"
export GOPATH="$HOME/go"

set -o vi
set editing-mode vi
set keymap vi-command
bindkey "^A"    beginning-of-line
bindkey "^E"    end-of-line
bindkey "^F"    forward-char
bindkey "^B"    backward-char
bindkey "^U"    backward-kill-line

# FZF settings
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_COMPLETION_TRIGGER=''
bindkey '^S' fzf-file-widget
bindkey '^T' fzf-completion
bindkey '^I' $fzf_default_completion
ftags() {
  local line
  [ -e tags ] &&
  line=$(
    awk 'BEGIN { FS="\t" } !/^!/ {print toupper($4)"\t"$1"\t"$2"\t"$3}' tags |
    cut -c1-80 | fzf --nth=1,2
  ) && $EDITOR $(cut -f3 <<< "$line") -c "set nocst" \
                                      -c "silent tag $(cut -f2 <<< "$line")"
}
c() {
  local dir
  dir="$(fasd -Rdl "$1" | fzf -1 -0 --no-sort +m)" && cd "${dir}" || return 1
}
t() {
  rspec "$@" && say Enemy down! || (open -a iTerm; say Under attack!)
}

test -e ${HOME}/.iterm2_shell_integration.zsh && source ${HOME}/.iterm2_shell_integration.zsh
iterm2_print_user_vars() {
  iterm2_set_user_var cTime $(date "+%M")
}

export NVM_DIR="/Users/tornado/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

source "$HOME/nobrick/dotfiles_private/.zshrc"
