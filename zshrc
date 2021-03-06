fpath=( "$HOME/.zfunctions" $fpath )
DEFAULT_USER=nsdragon

# Updated path
export PATH=$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$HOME/.local/games:$HOME/.local/bin:$HOME/bin:$PATH


# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="node-fonts"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# BG Notify set to 10 seconds
bgnotify_threshold=10

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(archlinux atom bower catimg coffee colored-man-pages colorize command-not-found encode64 extract fasd git git-flow jsontools node npm rvm safe-paste systemd zsh-completions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

# My stuff

eval $(dircolors -b $HOME/.dircolors)

# Completions
autoload -U compinit && compinit

# Prevent duplicate history lines
setopt HIST_IGNORE_DUPS

# Custom aliases
alias zr="source ~/.zshrc"

alias glt="git log --graph --pretty=format:'%Cred%h$Creset %C(cyan)%an%Creset - %C(yellow)%d%Creset %s %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"

# Quash output
alias open="xdg-open > /dev/null 2>&1"
alias gvim="gvim > /dev/null 2>&1"

# Easy copy/paste from XClipboard
alias cbc="xclip -selection clipboard"
alias cbp="xclip -o -selection clipboard"

# Alternate Sublime Text stuff
alias st="sublime"
alias stt="st ."

feh-gal() {
  feh -qSmtime -. --reverse
}

# Total size of subdirectories
sds() {
  du -h -d$1 .
}

# Download all images from a 4chan thread
4chimg() {
  wget -O - $1 |
  grep -Eo 'images.4chan.org/[^"]+' |
  uniq |
  xargs wget
}

# Obtain placeholder from placingbad.com
placingbad() {
  curl http://placingbad.com/$1/$2
}

# curl headers only
headers() {
  curl -s -D - $1 -o /dev/null
}

# Really quiet looping mpv
alias quiet-mpv="mpv --really-quiet --loop-file inf"

# Easy AUR add
auradd() {
  cd ~/aur && git clone https://aur.archlinux.org/$1.git && cd $1
}

# nvm stuff
export NVM_SYMLINK_CURRENT=true
[[ -s "$HOME/.nvm/nvm.sh" ]] && source "$HOME/.nvm/nvm.sh"

# Java and Grails
# export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64

# Android SDK
export ANDROID_HOME=$HOME/Android/Sdk

# Linuxbrew
# export PATH="$HOME/.linuxbrew/bin:$PATH"
# export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
# export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"

# vim: set et ts=2 sw=2:
###-begin-npm-completion-###
#
# npm command completion script
#
# Installation: npm completion >> ~/.bashrc  (or ~/.zshrc)
# Or, maybe: npm completion > /usr/local/etc/bash_completion.d/npm
#

COMP_WORDBREAKS=${COMP_WORDBREAKS/=/}
COMP_WORDBREAKS=${COMP_WORDBREAKS/@/}
export COMP_WORDBREAKS

if type complete &>/dev/null; then
  _npm_completion () {
    local si="$IFS"
    IFS=$'\n' COMPREPLY=($(COMP_CWORD="$COMP_CWORD" \
                           COMP_LINE="$COMP_LINE" \
                           COMP_POINT="$COMP_POINT" \
                           npm completion -- "${COMP_WORDS[@]}" \
                           2>/dev/null)) || return $?
    IFS="$si"
  }
  complete -F _npm_completion npm
elif type compdef &>/dev/null; then
  _npm_completion() {
    si=$IFS
    compadd -- $(COMP_CWORD=$((CURRENT-1)) \
                 COMP_LINE=$BUFFER \
                 COMP_POINT=0 \
                 npm completion -- "${words[@]}" \
                 2>/dev/null)
    IFS=$si
  }
  compdef _npm_completion npm
elif type compctl &>/dev/null; then
  _npm_completion () {
    local cword line point words si
    read -Ac words
    read -cn cword
    let cword-=1
    read -l line
    read -ln point
    si="$IFS"
    IFS=$'\n' reply=($(COMP_CWORD="$cword" \
                       COMP_LINE="$line" \
                       COMP_POINT="$point" \
                       npm completion -- "${words[@]}" \
                       2>/dev/null)) || return $?
    IFS="$si"
  }
  compctl -K _npm_completion npm
fi
###-end-npm-completion-###

###-tns-completion-start-###
if [ -f /home/nsdragon/.tnsrc ]; then 
    source /home/nsdragon/.tnsrc 
fi
###-tns-completion-end-###

# Hopefully fix systemd/dbus crap
dbus-update-activation-environment --systemd --all

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
