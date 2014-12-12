# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="mh"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(bower coffee colorize command-not-found debian encode64 extract fasd git git-flow lol node npm rvm safe-paste themes zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

# My stuff

eval $(dircolors -b $HOME/.dircolors)

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

# Obtain placeholder from placekitten.com
catph() {
  curl http://placekitten.com/$1/$2
}

# curl headers only
headers() {
  curl -s -D - $1 -o /dev/null
}

# Really quiet looping mpv
alias quiet-mpv="mpv --really-quiet --loop-file inf"

# RVM and NVM stuff (ruby and node.js)
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
[[ -s "$HOME/Development/nvm/nvm.sh" ]] && source "$HOME/Development/nvm/nvm.sh"

# Java and Grails
export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64
export GRAILS_HOME=$HOME/bin/grails-2.2.3

# Linuxbrew
export PATH="$HOME/.linuxbrew/bin:$PATH"
export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"

# Updated path
export PATH=$HOME/.local/games:$HOME/.local/bin:$HOME/bin:$GRAILS_HOME/bin:/opt/vagrant/bin:$PATH

# vim: set et ts=2 sw=2:
