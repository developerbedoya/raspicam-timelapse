# raspicam-timelapse

## Purpose
The purpose of this scripts is to take some photos from a Raspberry Pi and make a daily stop motion video

## Usage

I'm using cron for taking photos each minute and making (and updating) the video each hour at minute 59

```
* *   * * *   pi  /home/pi/repos/raspicam-timelapse/raspicam_timelapse_photo.sh -o /home/pi/shared/raspicam-timelapse -a greyworld -m 4
59 *   * * *   pi  /home/pi/repos/raspicam-timelapse/raspicam_timelapse_video.sh
```

Right now this is saving the timelapse videos in `/home/pi/shared/raspicam-timelapse/video`.

### Taking photos
See `raspicam_timelapse_photo --help` for more info

## Dependencies:

* `ffmpeg`

## TO-DO:

### Specify the output folder name as an argument for `raspicam_timelapse_video.sh`
Right now the output folder is specified in the variable `$output_folder`.

### Make a daemon for this
And stop using cron.