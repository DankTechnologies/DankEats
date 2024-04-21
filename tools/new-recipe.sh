#!/bin/bash

NAME=$1
SRC_DIR="/mnt/shares/pictures/dbk-phone"
PROJECT_DIR="/home/dan/code/dankeats"

cd "$PROJECT_DIR"

if [ $# -lt 1 ]; then
    echo "Usage: $0 recipe-name [hours-before-now]"
    exit 1
fi

# Create new recipe and images directory
hugo new content/recipes/${NAME}/index.md
mkdir -p content/recipes/${NAME}/images


# If the hours before now is provided
if [ ! -z "$2" ]; then
    HOURS_BEFORE_NOW=$2
    MINUTES_BEFORE_NOW=$((HOURS_BEFORE_NOW * 60))

    # Find and copy images modified within the specified timeframe
    find "$SRC_DIR" -name "PXL_*.jpg" -type f -mmin -$MINUTES_BEFORE_NOW -exec cp {} content/recipes/${NAME}/images/ \;

    echo "Pictures copied to images folder"
fi
