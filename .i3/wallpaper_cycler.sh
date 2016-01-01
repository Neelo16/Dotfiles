#!/bin/bash

SHUFFLE=YES
WALLPAPERDIR="$HOME/Pictures/Wallpapers"
DELAY=300

trap ':' USR1 # Send a SIGUSR1 to this process to skip to the next wallpaper

while true
do
	FILES="$WALLPAPERDIR"/*
	if [[ "$SHUFFLE" ]]
	then
		FILES=$(shuf -e $FILES)
	fi
	for WALLPAPER in $FILES
	do
		feh --bg-max "$WALLPAPER"
		sleep $DELAY &
		wait
	done
done
