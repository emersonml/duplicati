#!/bin/sh

LOG="/scripts/debug-nextcloud-app-data-before.log"

log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" >> "$LOG"
}

log "=== Iniciando pre-backup nextcloud data ==="

docker run --rm --privileged --pid=host alpine \
    nsenter -t 1 -m -u -i -n /bin/bash /etc/scripts/nextcloud-app-data-before.sh >> "$LOG" 2>&1

if [ $? -ne 0 ]; then
    log "ERRO: pre-backup data falhou!"
    exit 1
fi

log "=== Pre-backup data concluído ==="
