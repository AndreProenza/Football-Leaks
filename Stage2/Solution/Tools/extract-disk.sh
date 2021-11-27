#!/bin/bash

if [ ! $# -eq 3 ]
  then
    echo -e "No disk image given...\n"
    echo "Usage: ./extrach-disk.sh <disk image> <offset to extract> <inode of directory>"
    echo "Example: ./extrach-disk.sh charlied_disk.img 1052672 393218"
    echo "Example extracts /home from charlie_disk.img"
    exit 1
fi


while IFS= read -r line; do
    # ex: "12345:"
    echo $line
    digits_aux=$(echo $line | awk '{print $2}')
    # remove o :
    digits=${digits_aux%:*}
    # ex: "/charlied/txt"
    file_name=$( echo $line | awk '{print $3}')

    # create directory and file to output
    mkdir -p "${file_name%/*}" && touch "$file_name"
  
    icat -o 1052672 $1 $digits > $file_name

done < <(fls -Fru -o $2 $1 $3)