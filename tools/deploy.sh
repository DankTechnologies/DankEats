#!/bin/bash
set -e

PROJECT_DIR="/home/dan/code/dankeats"

cd "$PROJECT_DIR"

PRE_BUILD_CHECKSUM=$(find "$PROJECT_DIR/public" -type f -exec sha256sum {} \; | sort -k 2 | sha256sum)

/usr/local/bin/hugo

POST_BUILD_CHECKSUM=$(find "$PROJECT_DIR/public" -type f -exec sha256sum {} \; | sort -k 2 | sha256sum)

if [ "$PRE_BUILD_CHECKSUM" != "$POST_BUILD_CHECKSUM" ]
then
    echo "Changes detected"

    echo "Indexing pages with pagefind..."
    /usr/bin/npx -y pagefind --site public

    echo "Deploying to Cloudflare..."
    /usr/bin/npx --yes wrangler pages deploy "$PROJECT_DIR/public" --project-name dankeats --commit-dirty
else
    echo "No changes detected, skipping deployment."
fi