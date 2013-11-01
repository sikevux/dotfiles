#!/usr/bin/env bash

echo -e "Usage: bootstrap.sh [-b | -f]
Were:
-b means backup original files
-f means force install\n"

if [ ! -z "$1" ] && [ "$1" = "-b" ]; then
	echo "Using backup-feature. Look for *_ORIGINAL-files in ~"
	BACKUP="--backup --suffix=_ORIGINAL"
else
	BACKUP=""
fi

cd "$(dirname "${BASH_SOURCE}")"
git pull origin master

function doIt() {
	rsync $BACKUP --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" \
		--exclude "README.md" --exclude "LICENSE-MIT.txt" -av --no-perms . ~
	source ~/.bash_profile
}
if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
	echo
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt
	fi
fi
unset doIt
