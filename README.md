# raspicam-timelapse

## Purpose
The purpose of this scripts is to take some photos from a Raspberry Pi and make a daily stop motion video

## Usage
I'm using cron for taking photos each 5 minutes and making videos just before midnight

```
*/5 *   * * *   pi  /home/pi/repos/raspicam-timelapse/raspicam_timelapse_photo.sh
59 23   * * *   pi  /home/pi/repos/raspicam-timelapse/raspicam_timelapse_video.sh
```

Right now this is saving the pictures in `/home/pi/shared/raspicam-timelapse`, and the timelapse videos in `/home/pi/shared/raspicam-timelapse/video`.

## Dependencies:

* `ffmpeg`

## TO-DO:

### Specify the output folder name as an argument
Right now the output folder is specified in the variable `$output_folder`.

### Make a daemon for this
And stop using cron.