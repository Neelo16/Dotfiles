#!/bin/bash

INFO=$(xwininfo -root -tree | grep " - mpv" | grep gl | cut -f 2 -d \" | sed "s/\ -\ mpv//")

echo -n "$INFO"
