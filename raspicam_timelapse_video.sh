#!/usr/bin/bash

# File options
date_fmt=$(date +"%Y-%m-%d")
date_fmt_yesterday=$(date +"%Y-%m-%d" -d yesterday)
working_directory="." # "/home/pi/shared/raspicam-timelapse"
output_file_name=$date_fmt.mp4

# Video options
framerate=30

# Unknown parameters
unknown_parameters=()

show_help() {
    cat <<EOF

Usage: 
    raspicam_timelapse_video.sh (options)

Options 
    --help
        Show this text         

    -w working_directory, --working-directory working_directory
        Set working directory (defaults to current directory)
    
    -f framerate, --framerate framerate
        Set video framerate (default: 30)

EOF
}

make_video() {
    output_directory="$working_directory/video"
    old_photos_directory="$working_directory/old_pics/$date_fmt"

    mkdir -p "$output_directory"
    ffmpeg \
        -y -hide_banner -loglevel error \
        -framerate $framerate \
        -pattern_type glob \
        -i "$old_photos_directory/*.jpg" \
        -c:v libx264 \
        "$output_directory/$output_file_name" > /dev/null 
}

move_old_files() {
    old_photos_directory="$working_directory/old_pics/$date_fmt"

    mkdir -p "$old_photos_directory"
    mv "$working_directory/"*.jpg "$old_photos_directory"
}

delete_yesterday_photos_directory() {
    yesterday_photos_directory="$working_directory/old_pics/$date_fmt_yesterday"
    rm -rf "$yesterday_photos_directory" || true
}


# https://stackoverflow.com/a/14203146
while [[ $# -gt 0 ]]
do
    key="$1"

    case $key in
        --help)
            show_help
            exit 0
            ;;
            
        -w|--working-directory)
            working_directory="$2"
            shift
            shift
            ;;

	-f|--framerate)
	    framerate="$2"
	    shift
	    shift
	    ;;

        *)
            unknown_parameters+=("$1")
            shift
            ;;
    esac
done

if [ ${#unknown_parameters[@]} -gt 0 ]; then
    for i in ${unknown_parameters[@]}
    do
        echo "Unrecognized option: '$i'"
    done

    show_help
    exit 1
fi


move_old_files
make_video
delete_yesterday_photos_directory
