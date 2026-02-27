#!/bin/sh
chmod -R 777 /tmp/duplicati

chown -R :1100 /srv/docker/volumes/nextcloud_*
chmod -R 770 /srv/docker/volumes/nextcloud_*
