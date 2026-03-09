#!/bin/sh

LOG="/scripts/debug-nextcloud-app-config-after.log"

log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" >> "$LOG"
}

log "=== Iniciando pos-backup nextcloud config ==="

docker run --rm --privileged --pid=host alpine \
    nsenter -t 1 -m -u -i -n /bin/bash /etc/scripts/nextcloud-app-config-after.sh >> "$LOG" 2>&1

if [ $? -ne 0 ]; then
    log "ERRO: falha ao subir nextcloud!"
    exit 1
fi

log "=== Pos-backup config concluído ==="
