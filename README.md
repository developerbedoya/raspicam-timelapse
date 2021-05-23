# raspicam-timelapse

## Purpose
The purpose of this scripts is to take some photos from a Raspberry Pi and make a daily stop motion video

## Usage
I'm using cron for taking photos each 5 minutes.

```
*/5 *   * * *   pi  /home/pi/repos/raspicam-timelapse/raspicam_timelapse_photo.sh
```

Right now this is saving the pictures in `/home/pi/shared/raspicam-timelapse`, and in the future will save the stop motion daily videos in the same folder.

## TO-DO:

### Create script for creating the stop motion videos
Right now it only create a series of images.

### Specify the output folder name as an argument
Right now the output folder is specified in the variable `$output_folder`.

### Make a daemon for this
And stop using cron.