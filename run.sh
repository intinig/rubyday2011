#!/bin/sh

gource custom.log --auto-skip-seconds 0.5 --max-files 0 --date-format "%B %d %Y" --seconds-per-day 1 --max-file-lag 0.5 -e 1.5 --bloom-multiplier 0.5 --bloom-intensity 0.5 --file-idle-time 5 -1024x768 --hide filenames,dirnames

# -o - | ffmpeg -y -b 3000K -r 60 -f image2pipe -vcodec ppm -i - -vcodec libx264 -vpre slow -threads 0 gource.mp4
# 2.5
