#!/bin/bash

SHUFFLE=YES
WALLPAPERDIR="$HOME/Pictures/Wallpapers"
DELAY=60

trap ':' USR1 # Send a SIGUSR1 to this process to skip to the next wallpaper
trap 'break' USR2 # Send a SIGUSR2 to this process to reload the wallpapers
		  # and restart the loop

IFS=$'\n'

while true
do
	FILES=($(find "$WALLPAPERDIR" -type f))
	if [[ "$SHUFFLE" ]]
	then
		FILES=($(shuf -e ${FILES[@]}))
	fi
	for WALLPAPER in ${FILES[@]}
	do
		if [ "$DESKTOP_SESSION" == "gnome" ]; then
				gsettings set org.gnome.desktop.background picture-uri "file://$WALLPAPER"
		fi
		feh --bg-max "$WALLPAPER"
		sleep $DELAY &
		wait
	done
done
