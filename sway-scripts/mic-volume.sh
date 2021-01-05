if [ -z $1 ]; then
    echo "up or down?"
    exit 1
fi

if [ "$1" == "up" ]; then
    pactl set-source-volume @DEFAULT_SOURCE@ +10%
fi

if [ "$1" == "down" ]; then
    pactl set-source-volume @DEFAULT_SOURCE@ -10%
fi

