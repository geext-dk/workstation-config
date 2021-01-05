#!/bin/bash

if [ -z $1 ]; then
    echo "You must provide a path to a wallpaper image..."
    exit 1
fi

if [ ! -f $1 ]; then
    echo "The path you provided is not a file..."
    exit 1
fi

sed -i "s|^output \* bg [^ ]* [^ ]*$|output \* bg \"$1\" fill|g" $HOME/.config/sway/config

echo "Success"
