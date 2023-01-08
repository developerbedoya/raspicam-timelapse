#!/usr/bin/bash

# File options
output_directory="."
width=1640
height=1232
quality=70

# Camera options
# Documentation at https://www.raspberrypi.com/documentation/computers/camera_software.html#common-command-line-options
exposure=normal
awb=auto

# Fixed parameters
file_name=$(date +"%Y-%m-%d-%H-%M-%S").jpg
annotate="%d/%m/%y %H:%M:%S"

# Unknown parameters
unknown_parameters=()

show_help() {
    cat <<EOF

Usage: 
    raspicam_timelapse_photo.sh (options)

Options 
    --help
        Show this text         

    -o output_directory, --output-directory output_directory
        Set output directory (defaults to current directory)
    
    -w width, --width width
        Set output width (default: 1640)

    -h height, --height height
        Set output height (default: 1232)
            
    -q quality, --quality quality
        Set output quality (0 to 100, default: 70)

    -e exposure, --exposure exposure
        Set exposure mode (see https://www.raspberrypi.com/documentation/computers/camera_software.html#common-command-line-options)
        (default: normal)

    -a awb, --awb awb)
        Set automatic white balance (see https://www.raspberrypi.com/documentation/computers/camera_software.html#common-command-line-options)
        (default: auto)

EOF
}

take_photo() {
    libcamera-jpeg \
	--tuning-file /usr/share/libcamera/ipa/raspberrypi/imx219_noir.json \
        --nopreview \
        --width $width \
        --height $height \
        --quality $quality \
	--exposure $exposure \
	--awb $awb \
        --output "$output_directory/$file_name"
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
            
        -o|--output-directory)
            output_directory="$2"
            shift
            shift
            ;;

        -w|--width)
            width="$2"
            shift
            shift
            ;;
        
        -h|--height)
            height="$2"
            shift
            shift
            ;;

        -q|--quality)
            quality="$2"
            shift
            shift
            ;;

        -e|--exposure)
            exposure="$2"
            shift;
            shift;
            ;;

        -a|--awb)
            awb="$2"
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

take_photo
