#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{git-prompt.sh,path,bash_prompt,exports,aliases,functions,extra}; do
        [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

if [ -r /usr/share/git/completion/git-completion.bash ]; then
	source /usr/share/git/completion/git-completion.bash
fi

export PS1='\[\e[G\][\A|$?]\[\e[1m\]\u@\h\[\e[0m\]:\W$(__git_ps1 " (%s)")\$ '

export PATH=~/bin:~/.gem/ruby/2.0.0/bin:$PATH
export GEM_HOME=~/.gem/ruby/2.0.0

