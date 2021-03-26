start_time=0:0
duration=8

palette="/tmp/palette.png"

filters="fps=15,scale=256:384:flags=lanczos"

ffmpeg -v warning -ss $start_time -t $duration -i $1.mp4 -vf "$filters,palettegen" -y $palette
ffmpeg -v warning -ss $start_time -t $duration -i $1.mp4 -i $palette -lavfi "$filters [x]; [x][1:v] paletteuse" -y $1.gif
