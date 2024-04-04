#!/bin/bash

# Intenta obtener la canción de MPD primero
MPD_SONG=$(mpc current)
if [ ! -z "$MPD_SONG" ]; then
    echo "$MPD_SONG"
else
    # Si no hay canción en MPD, intenta obtener la canción de Spotify
    ~/.config/eww/spotify/scripts/spotify-song.sh
fi

