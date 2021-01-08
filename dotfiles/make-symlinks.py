#!/usr/bin/env python3
import os
import sys

DEBUG = False
if os.environ['DEBUG'] == '1':
    DEBUG = True

def print_info(info):
    if DEBUG:
        print(info)

COPYSWAYCONF = False
if os.environ['SWAY'] == '1':
    COPYSWAYCONF = True

# Elements in tuples are in the following order:
# 1. Configuration directory for a destination config
# 2. Name of the configuration file in destination
# 3. Name of the configuration file in source
configs = [
    ('.config/nvim', 'init.vim', 'init.vim'),
]

if COPYSWAYCONF:
    configs += [
        ('.config/sway', 'config', 'sway/config'),
        ('.config/sway', 'bar.config', 'sway/bar.config'),
        ('.config/sway', 'hotkeys.config', 'sway/hotkeys.config'),
        ('.config/sway', 'idle.config', 'sway/idle.config'),
        ('.config/sway', 'input.config', 'sway/input.config'),
        ('.config/sway', 'output.config', 'sway/output.config'),
        ('.config/sway', 'theme.config', 'sway/theme.config'),
        ('.config/sway', 'variables.config', 'sway/variables.config'),
        ('.config/waybar', 'config', 'sway/waybar.config'),
        ('.config/waybar', 'style.css', 'sway/waybar.css'),
        ('.config/swaylock', 'config', 'sway/swaylock.config'),
        ('.config/mako', 'config', 'sway/mako.config'),
        ('.config/alacritty', 'alacritty.yml', 'sway/alacritty.yml')
    ]

for (_, _, srcname) in configs:
    if not os.path.exists(srcname):
        print(f"The configuration file \"{srcname}\" does not exist", file=sys.stderr)
        exit(1)

for (destdir, destname, srcname) in configs:
    destdir = os.environ['HOME'] + '/' + destdir
    if not os.path.exists(destdir):
        os.mkdir(destdir)
    srcpath = os.getcwd() + '/' + srcname
    destpath = destdir + '/' + destname

    print_info('srcpath: ' + srcpath)
    print_info('destpath: ' + destpath)
    if os.path.lexists(destpath):
        print_info('destpath exists')
        if os.path.islink(destpath):
            print_info('despath is a symlink')
            if os.path.realpath(destpath) == srcpath:
                print_info('The symlink points to the same file. Skipping...')
                continue
            else:
                print_info('The symlink points to a different file. Replacing...')
                os.unlink(destpath)
        else:
            print_info('destpath is not a symlink. renaming')
            os.rename(destpath, destpath + '.bak')
    else:
        print_info('destpath does not exist')

    # create a symlink pointing to srcpath named destpath
    os.symlink(srcpath, destpath)
