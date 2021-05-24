#!/usr/bin/bash

# File options
date_fmt=$(date +"%Y-%m-%d")
input_folder="/home/pi/shared/raspicam-timelapse"
output_folder="/home/pi/shared/raspicam-timelapse/video"
old_folder="/home/pi/shared/raspicam-timelapse/old_pics/$date_fmt"
output_file_name=$date_fmt.mp4

# Video options
framerate=30

make_video() {
    ffmpeg \
        -y \
        -framerate $framerate \
        -pattern_type glob \
        -i "$old_folder/*.jpg" \
        -c:v libx264 \
        "$output_folder/$output_file_name"
}

move_old_files() {
    mkdir -p "$old_folder"
    mv $input_folder/*.jpg "$old_folder"
}

move_old_files
make_video