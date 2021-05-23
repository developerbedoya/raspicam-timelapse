#!/usr/bin/bash

# File options
output_folder="/home/pi/shared/raspicam-timelapse"
file_name=$(date +"%Y-%m-%d-%H-%M-%S").jpg
width=1024
height=768
quality=70

# Camera options
# Documentation at https://www.raspberrypi.org/documentation/raspbian/applications/camera.md
exposure=auto
awb=greyworld
mode=4
annotate="%d/%m/%y %H:%M:%S"

take_photo() {
    raspistill \
        --nopreview \
        --exposure $exposure \
        --awb $awb \
        --mode $mode \
        --annotate 4 \
        --annotate "$annotate" \
        --width $width \
        --height $height \
        --quality $quality \
        --output "$output_folder/$file_name"
}

take_photo