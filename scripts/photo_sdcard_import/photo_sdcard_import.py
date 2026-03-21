#!/usr/bin/env python3

import argparse
import os
import re
from datetime import date
import subprocess


def confirmation_prompt(message):
    while True:
        response = input(f"{message} (y/n): ").strip().lower()
        if response in ("y", "yes"):
            return True
        elif response in ("n", "no"):
            return False
        else:
            print('Please enter "y" or "n".')


def album_directory(begin_date, end_date, album_name):
    from_str = begin_date.strftime("%Y-%m-%d")

    if begin_date.year != end_date.year:
        to_str = end_date.strftime("%Y-%m-%d")
    elif begin_date.month != end_date.month:
        to_str = end_date.strftime("%m-%d")
    elif begin_date.day != end_date.day:
        to_str = end_date.strftime("%d")
    else:
        to_str = None

    return " ".join(value for value in (from_str, to_str, album_name) if value)


def parse_date(input):
    return date.strptime(input, "%d-%m-%Y")


def execute(command, error_message):
    if os.system(command) != 0:
        print(f"Error: {error_message}")
        exit(1)


def error(message):
    print(f"Error: {message}")
    exit(1)


if __name__ == "__main__":
    today = date.today()

    parser = argparse.ArgumentParser(
        prog=os.path.basename(__file__),
        description="Imports photos from camera SD card to local `photo-video` directory",
    )
    parser.add_argument("album_name", help="The name used in the album directory name")
    parser.add_argument(
        "--volume",
        default="Untitled",
        help="Name of the SD card volume to copy data from",
    )
    parser.add_argument(
        "--begin",
        default=today,
        type=parse_date,
        help="Start date of the photoshoot (dd-mm-yyyy)",
    )
    parser.add_argument(
        "--end", type=parse_date, help="End date of the photoshoot (dd-mm-yyyy)"
    )
    args = parser.parse_args()

    begin_date = args.begin
    end_date = args.end if args.end else begin_date

    if not args.album_name:
        error("Album name cannot be empty")

    if "/" in args.album_name:
        error('Album name cannot include "/"')

    if end_date < begin_date:
        error("End date must be after start date")

    volumes_list = subprocess.check_output(["diskutil", "list"], text=True)
    volume_matches = re.findall(
        rf"^\s*\d+:\s+Windows_NTFS\s+({args.volume})\s+(128.0 GB)\s+(disk\d+)s1$",
        volumes_list,
        re.MULTILINE,
    )

    if not volume_matches:
        error(f"Volume '{args.volume}' not found.")

    if len(volume_matches) > 1:
        error("Ambigious volume details.")

    volume_name, volume_size, disk_identifier = volume_matches[0]

    source_directory = f"/Volumes/{volume_name}/DCIM/100MSDCF/"
    target_directory = f"$HOME/photo-video/{album_directory(begin_date, end_date, args.album_name)}/raw/"

    execute(f'mkdir -p "{target_directory}"', "Failed to create target directory")
    execute(
        f'rsync -avh --info=progress2 {source_directory} "{target_directory}"',
        "rsync failure",
    )

    if confirmation_prompt(
        f"Identified SD card as `{disk_identifier}` ('{volume_name}', {volume_size}). Do you want to format it?"
    ):
        execute(f"diskutil unmountDisk {disk_identifier}", "Failed to unmount volume")
        execute(
            f'diskutil eraseDisk ExFAT "{volume_name}" MBR {disk_identifier}',
            "Failed to format volume",
        )
        execute(f"diskutil eject {disk_identifier}", "Failed to eject volume")
    else:
        execute(f'diskutil eject "{args.volume}"', "Failed to eject volume")
