#!/bin/bash

SOURCE_DIR="/home/dan/code/dankeats/"

BACKUP_DIR="/mnt/shares/backups/dankeats/"

# Rsync options
# -a: archive mode; preserves permissions, symlinks, etc.
# -v: verbose; provides detailed output
# --delete: deletes extraneous files from destination not present in source
RSYNC_OPTS="-av --delete"

rsync $RSYNC_OPTS "$SOURCE_DIR" "$BACKUP_DIR"

echo "Backup completed: $(date)"
