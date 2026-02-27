#!/bin/sh
curl -s --unix-socket /var/run/docker.sock -X POST "http://localhost/v1.44/containers/nextcloud-db/start"
curl -s --unix-socket /var/run/docker.sock -X POST "http://localhost/v1.44/containers/nextcloud-redis0/start"
curl -s --unix-socket /var/run/docker.sock -X POST "http://localhost/v1.44/containers/nextcloud-app/start"
