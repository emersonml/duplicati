#!/bin/bash

set -euo pipefail


# Volumes nextcloud  →  root:duplicati  drwxrwx--x (771)
for dir in /srv/docker/volumes/nextcloud_*/; do
    chown -R :duplicati "$dir"
    chmod -R 771 "$dir"
done

