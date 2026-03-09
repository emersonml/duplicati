#!/bin/sh

LOG="/scripts/debug-nextcloud-db-dump-before.log"

log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" >> "$LOG"
}

log "=== Iniciando pre-backup DB dump ==="

docker run --rm --privileged --pid=host alpine \
    nsenter -t 1 -m -u -i -n /bin/bash /etc/scripts/nextcloud-db-dump-before.sh >> "$LOG" 2>&1

if [ $? -ne 0 ]; then
    log "ERRO: dump falhou!"
    exit 1
fi

log "=== Pre-backup DB dump concluído ==="
