#!/bin/sh
curl -s --unix-socket /var/run/docker.sock -X POST "http://localhost/v1.44/containers/nextcloud-app/stop"
curl -s --unix-socket /var/run/docker.sock -X POST "http://localhost/v1.44/containers/nextcloud-redis0/stop"
curl -s --unix-socket /var/run/docker.sock -X POST "http://localhost/v1.44/containers/nextcloud-db/stop"
