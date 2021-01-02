if [ -z $1 ]; then
    echo "up or down?"
    exit 1
fi

if [ "$1" == "up" ]; then
    pactl set-sink-volume @DEFAULT_SINK@ +5%
fi

if [ "$1" == "down" ]; then
    pactl set-sink-volume @DEFAULT_SINK@ -5%
fi

SINK=$(pactl list short sinks | \
	sed -e 's,^\([0-9][0-9]*\)[^0-9].*,\1,' | \
	head -n 1)

CURRENTVOLUME=$(pactl list sinks | \
	grep '^[[:space:]]Volume:' | \
	head -n $(( $SINK + 1 )) | \
	tail -n 1 | \
	sed -e 's,.* \([0-9][0-9]*\)%.*,\1,')

/home/geext/.local/bin/notify-send.sh "Volume" --hint int:value:$CURRENTVOLUME --replace-file=$HOME/.cache/volumenotification
