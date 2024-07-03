#!/bin/bash


if [ "$#" -ne 4 ]; then
    echo "Usage: $0 <directory to monitor> <pattern> <base path> <subdirectory>"
    exit 1
fi


DIR_TO_MONITOR=$1
PATTERN=$2
BASE_PATH=$3
SUB_DIRECTORY=$4

while true; do
    files_found=0 

    for file in "$DIR_TO_MONITOR"/$PATTERN; do
        if [ -f "$file" ]; then
            files_found=1
            filename="${file##*/}"
            base_name="${filename%.*}" 
            name=$(echo "$base_name" | cut -d'_' -f1)
            role=$(echo "$base_name" | cut -d'_' -f2)
            company=$(echo "$base_name" | cut -d'_' -f3)
            doc=$(echo "$base_name" | cut -d'_' -f4)

            directory="$BASE_PATH/$SUB_DIRECTORY/$company/$role" 
            mkdir -p "$directory" 
            mv "$file" "$directory/$filename"
            echo "Moved $file to $directory/$filename"
        fi
    done

    if [ $files_found -eq 0 ]; then
        echo "No files matching $PATTERN found."
    fi

    sleep 30
done
