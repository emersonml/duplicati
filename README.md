sudo groupadd -g 1100 duplicati
sudo useradd -u 1100 -g 1100 -r -s /usr/sbin/nologin duplicati

# BACKUPS
sudo chown -R 1100:1100 /srv/backups; sudo chmod -R 750 /srv/backups

# VOLUMES
#systemctl status restaura-permissoes.service ## executa os scripts para volumes

# SCRIPTS
  ## permissoes volumes 
#/etc/scripts/restaura_permissoes.sh 
  ## jobs de backups 
sudo chown -R :1100 /opt/projects/duplicati/volumes






# ==== BOM SABER
#Recomendação adicional: Considere usar UIDs/GIDs na faixa 1000-2000 para serviços, mantendo separação clara dos usuários normais do sistema.

# 1. Copiar o busybox para dentro do container
docker cp $(which busybox) portainer-app:/busybox

# 2. Executar o busybox como shell
docker exec -it portainer-app /busybox sh
