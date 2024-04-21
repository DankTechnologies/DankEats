#!/bin/bash

WATCH_DIR="./content"
PROCESSED_FILE_LIST="$WATCH_DIR/jpegshrinkd.log"

touch "$PROCESSED_FILE_LIST"

process_image() {
    local image_path="$1"
    local temp_image="temp_$(basename "$image_path")"
    local final_image="$image_path"

    convert "$image_path" -resize 1920x1920\> "$temp_image"
    jpegoptim --max=85 "$temp_image"
    mv "$temp_image" "$final_image"

    echo "$image_path" >> "$PROCESSED_FILE_LIST"
}

inotifywait -m -r -e close_write --format '%w%f' "$WATCH_DIR" | while read FILE
do
    if [[ "$FILE" =~ \.jpg$ ]] && ! grep -Fxq "$FILE" "$PROCESSED_FILE_LIST"; then
        echo "Processing $FILE..."
        process_image "$FILE"
    fi
done
