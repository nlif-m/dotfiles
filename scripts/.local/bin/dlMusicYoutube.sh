#!/bin/sh

set -xe

yd_dl=yt-dlp

song_folder=~/Music/songs
song_list="$song_folder/song_list.txt"

playlist_folder=~/Music/playlists
playlist_list="$playlist_folder/playlist_list.txt"

action=$(printf "song\nplaylist" | dmenu -p "What are you downloading ?") || exit

check_is_valid_url()
{
    # TODO: make a smart check of playlist action
    # because $yd_dl --get-title get all title from playlist
    # that not what need
    url=$(xclip -o)
    yd_dl_opt_song="--get-title"
    yd_dl_opt_playlist="--playlist-items 1 --get-filename -o '%(playlist)s'"
    case $action in 
        "song" ) title=$($yd_dl $yd_dl_opt_song "$url") || exit;;
        "playlist" ) title=$($yd_dl $yd_dl_opt_playlist "$url") || exit ;;
    esac

    answer=$(printf "yes\nno" | dmenu -p "Is $title what you want ?") || exit

    case $answer in 
        "yes" ) ;;
        "no"  ) exit ;;
    esac
}

song_handle()
{
    mkdir -p "$song_folder" || exit 1
    # TODO: Make a option to download all songs from $song_list
    touch "$song_list" || exit 1
    yd_dl_opt="-i --download-archive $song_folder/ALREADY.txt -x -f bestaudio -o $song_folder/%(uploader)s-%(title)s.%(ext)s"
    notify-send "start_downloading" "$title"
    #TODO: handle situation where song already exists
    $yd_dl $yd_dl_opt "$1"
    echo "$1" >> "$song_list" || exit 2
    notify-send "finish_downloading" "$title"
}

playlist_handle()
{
    mkdir -p "$playlist_folder" || exit 1
    # TODO: Make a option to download all playlists from $playlist_list
    touch "$playlist_list" || exit 1
    yd_dl_opt="-i --download-archive $playlist_folder/ALREADY.txt -x -f bestaudio \
        -o $playlist_folder/%(playlist)s-%(playlist_uploader)s/%(playlist_index)s-%(title)s.%(ext)s"

    notify-send "start_downloading" "$title"

    #TODO: handle situation where playlist already exists
    $yd_dl $yd_dl_opt "$1"
    echo "$1" >> "$playlist_list" || exit 2
    notify-send "finish_downloading" "$title"
}


check_is_valid_url || exit

case "$action" in
    "song" )  song_handle "$url";;
    "playlist" ) playlist_handle "$url" ;;
    *  ) exit 1;;
esac

