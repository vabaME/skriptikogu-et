#!/bin/bash

# Define directories for each file type
music_dir="$HOME/Muusika"
video_dir="$HOME/Videod"
image_dir="$HOME/Pildid"
doc_dir="$HOME/Dokumendid"
other_dir="$HOME/TeisedFailid"
download_dir="$HOME/Allalaadimised"

# Create directories if they don't already exist
mkdir -p "$music_dir"
mkdir -p "$video_dir"
mkdir -p "$image_dir"
mkdir -p "$doc_dir"
mkdir -p "$other_dir"
mkdir -p "$download_dir"

# Move music files to the music directory
find $HOME $download_dir -maxdepth 1 -type f \( -iname "*.mp3" -o -iname "*.flac" -o -iname "*.wav" -o -iname "*.ogg" \) -exec mv {} "$music_dir" \;

# Move video files to the video directory
find $HOME $download_dir -maxdepth 1 -type f \( -iname "*.mp4" -o -iname "*.avi" -o -iname "*.mov" \) -exec mv {} "$video_dir" \;

# Move image files to the image directory
find $HOME $download_dir -maxdepth 1 -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" \) -exec mv {} "$image_dir" \;

# Move document files to the document directory
find $HOME $download_dir -maxdepth 1 -type f \( -iname "*.pdf" -o -iname "*.doc" -o -iname "*.docx" -o -iname "*.txt" \) -exec mv {} "$doc_dir" \;

# Move other files to the other directory
find $HOME $download_dir -maxdepth 1 -type f -not \( -iname "*.mp3" -o -iname "*.flac" -o -iname "*.wav" -o -iname "*.ogg" -o -iname "*.mp4" -o -iname "*.avi" -o -iname "*.mov" -o -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.pdf" -o -iname "*.doc" -o -iname "*.docx" -o -iname "*.txt" \) -exec mv {} "$other_dir" \;

echo "Failide sorteerimine on lõpetatud!"

