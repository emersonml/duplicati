# 1. Criar grupo e usuário do sistema
sudo groupadd -g 1100 duplicati
sudo useradd -u 1100 -g 1100 -r -s /usr/sbin/nologin duplicati

# 2. Ajustar permissões dos volumes

sudo chown :1100 /srv/docker/volumes; sudo chmod 751 /srv/docker/volumes
sudo chown 1100:emerson /srv/backups; sudo chmod 750 /srv/backups



# 3. Para /srv/volumes (source), adicione apenas leitura


#Recomendação adicional: Considere usar UIDs/GIDs na faixa 1000-2000 para serviços, mantendo separação clara dos usuários normais do sistema.