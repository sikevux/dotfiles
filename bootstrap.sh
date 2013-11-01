#!/usr/bin/env bash
cd "$(dirname "${BASH_SOURCE}")"
git pull origin master

if [ ! -z "$1" ] && [ "$1" = "-b" ]; then
	BACKUP="--backup --suffix=_ORIGINAL"
else
	BACKUP=""
fi

function doIt() {
	rsync $BACKUP --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" \
		--exclude "README.md" --exclude "LICENSE-MIT.txt" -av --no-perms . ~
	source ~/.bash_profile
}
if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt
else
	echo -e "Usage: bootstrap.sh [-b]\nWere -b means backup original files"
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
	echo
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt
	fi
fi
unset doIt
