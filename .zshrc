# Path to your oh-my-zsh installation.
export ZSH="${HOME}/.oh-my-zsh"

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

if [ -z "$GPG_TTY" ]; then
    GPG_TTY=$(tty)
    export GPG_TTY
fi

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

for test_path in $HOME/homebrew/bin \
		     $HOME/homebrew/sbin \
		     $GOPATH/bin \
		     $HOME/homebrew/opt/ncurses/bin \
		     $HOME/homebrew/opt/libpq/bin \
		     /usr/local/haskel/hask-bin \
		     $HOME/bin/; do
    if [ -d $test_path ]; then
	export PATH="$test_path:$PATH"
    fi
done

if command -v emacsclient &>/dev/null; then
    export EDITOR="emacsclient -c"
    alias emacs="$(command -v emacsclient) -c"
elif command -v emacs &>/dev/null; then
    export EDITOR="emacs"
else
    export EDITOR="mg"
fi

case $(uname) in
    Darwin)
	export HOMEBREW_NO_ANALYTICS=1
	export HOMEBREW_NO_INSECURE_REDIRECT=1
	export HOMEBREW_CASK_OPTS=--require-sha
	if [ -f "$(brew --prefix asdf)/asdf.sh" ]; then
	    source $(brew --prefix asdf)/asdf.sh
	fi
	;;
    Linux)
	export LANG="en_US.UTF-8"
	export LC_CTYPE="en_US.UTF-8"
	export GTK_IM_MODULE="xim"
	export LC_ALL="en_US.UTF-8"
	alias docker=podman
esac

if [ -f ~/.env ]; then
    source ~/.env
fi
