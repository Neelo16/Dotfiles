#!/bin/bash
CUR_ENGINE=$(ibus engine)

PT_ENGINE='xkb:pt::por'
JP_ENGINE='mozc-jp'
if [[ -z "$CUR_ENGINE" ]]; then
	exit
fi

if [[ "$CUR_ENGINE" = "$PT_ENGINE" ]]; then
	ibus engine "$JP_ENGINE"
	xmodmap -e 'keycode 127 = Zenkaku_Hankaku'
else 
	if [[ "$CUR_ENGINE" = "$JP_ENGINE" ]]; then
		ibus engine "$PT_ENGINE"
	else
		ibus restart
	fi
fi

setxkbmap -option caps:swapescape
