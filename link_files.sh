#!/bin/bash

set -e

# Make sure we handle filenames with spaces properly
# (names with \n will still break, but who the hell does that?)
IFS=$'\n'

function link_file {
	echo "$1"
	if [[ -f "$1" ]]; then
		link "$1" "$HOME/$2/$(basename "$1")"
	else
		if [[ -d "$1" ]]; then
			(link_dir "$1" "$2")
		fi
	fi
}

function link_dir {
	if ! [[ -d "$1" ]]; then
		return
	fi
	DIR="$2/$(basename "$1")"
	mkdir -p "$HOME/$DIR"
	cd "$1"
	find -maxdepth 1 ! -name "." | while read FILE
	do
		(link_file "$FILE" "$DIR")
	done
}

# Excludes the .git, README.md and current directories
find -maxdepth 1 ! -name ".git" ! -name "." ! -name "README.md" ! -name "link_files.sh" | while read FILE
do
	link_file "$FILE" .
done

