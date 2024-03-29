# raspicam-timelapse

## Purpose
The purpose of this scripts is to take some photos from a Raspberry Pi and make a daily stop motion video

## Usage

I'm using cron for taking photos each minute and making (and updating) the video each hour at minute 59

```
* *   * * *   /home/pi/repos/raspicam-timelapse/raspicam_timelapse_photo.sh -o /home/pi/shared/raspicam-timelapse -a auto -m 4
59 *   * * *   /home/pi/repos/raspicam-timelapse/raspicam_timelapse_video.sh -w /home/pi/shared/raspicam-timelapse
```

### Taking photos

```
Usage: 
    raspicam_timelapse_photo.sh (options)

Options 
    --help
        Show this text         

    -o output_directory, --output-directory output_directory
        Set output directory (defaults to current directory)
    
    -w width, --width width
        Set output width (default: 1024)

    -h height, --height height
        Set output height (default: 768)
            
    -q quality, --quality quality
        Set output quality (0 to 100, default: 70)

    -e exposure, --exposure exposure
        Set exposure mode (see https://www.raspberrypi.com/documentation/computers/camera_software.html#common-command-line-options)
        (default: normal)

    -a awb, --awb awb)
        Set automatic white balance (see https://www.raspberrypi.com/documentation/computers/camera_software.html#common-command-line-options)
        (default: auto)
```

### Making videos

```
Usage: 
    raspicam_timelapse_video.sh (options)

Options 
    --help
        Show this text         

    -w working_directory, --working-directory working_directory
        Set working directory (defaults to current directory)
    
    -f framerate, --framerate framerate
        Set video framerate (default: 30)
```

## Dependencies:

* `ffmpeg`
* `imagemagick`

## TODO:

### Make a daemon for this
And stop using cron.
