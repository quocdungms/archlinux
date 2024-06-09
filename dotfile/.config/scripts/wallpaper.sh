#!/usr/bin/env bash

WALLPAPER_DIR="$HOME/Pictures/wallpaper"
RANDOM_PICTURE=$(ls $WALLPAPER_DIR -1 | shuf -n 1)

nitrogen --set-auto "$WALLPAPER_DIR/$RANDOM_PICTURE"
