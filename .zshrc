# Path to your oh-my-zsh installation.
export ZSH="/Users/pgreco/.oh-my-zsh"

ZSH_THEME="robbyrussell"

export UPDATE_ZSH_DAYS=5

HIST_STAMPS="yyyy-mm-dd"

plugins=(
  terraform
  git
  bundler
  osx
  rake
  rbenv
  ruby
  aws
  asdf
)

source $ZSH/oh-my-zsh.sh

HISTFILE=~/.histfile
HISTSIZE=1000000
SAVEHIST=1000000000000000000
setopt appendhistory
unsetopt beep
bindkey -e

GPG_TTY=$(tty)
export GPG_TTY
if [ -f "${HOME}/.gpg-agent-info" ]; then
    . "${HOME}/.gpg-agent-info"
    export GPG_AGENT_INFO
    export SSH_AUTH_SOCK
fi

unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
    export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi

export LESS='-R'
export LESSCHARSET="utf-8"
export GOPATH="$HOME/go"
if command -v emacsclient &>/dev/null; then
    export EDITOR="emacsclient -c"
elif command -v emacs &>/dev/null; then
    export EDITOR="emacs"
else
    export EDITOR="mg"
fi

case $(uname) in
    Darwin)
	export PATH="$GOPATH/bin:$HOME/jdk-11.0.2+9/Contents/Home/bin:$HOME/homebrew/sbin:$HOME/homebrew/bin:$PATH"
	export HOMEBREW_NO_ANALYTICS=1
	export HOMEBREW_NO_INSECURE_REDIRECT=1
	export HOMEBREW_CASK_OPTS=--require-sha
	export PATH="/Users/pgreco/homebrew/opt/ncurses/bin:$PATH"
	export PATH="/Users/pgreco/homebrew/opt/libpq/bin:$PATH"
	alias emacs="/Users/pgreco/homebrew/bin/emacsclient -c"
	source $(brew --prefix asdf)/asdf.sh
	export PATH="/Users/pgreco/bin/:$PATH"
	;;
    Linux)
	export LANG="en_US.UTF-8"
	export LC_CTYPE="en_US.UTF-8"
	export GTK_IM_MODULE="xim"
	export LC_ALL="en_US.UTF-8"
	export PATH=$PATH:$GOPATH/bin:/usr/local/haskel/hask-bin
	alias emacs="emacsclient -c"
	alias docker=podman
esac
