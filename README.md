#!/bin/sh
chmod -R 777 /tmp/duplicati

chown root:1100 /srv/docker
chown root:1100 /srv/docker/volumes; chmod 751 /srv/docker/volumes;
chown -R :1100  /srv/docker/volumes/nextcloud_*; chmod 751                                        







sudo groupadd -g 1100 duplicati-data
sudo useradd -u 1100 -g 1100 -r -s /usr/sbin/nologin duplicati-data

# Identifique o id do grupo docker para adicionar no custom-cont-:
getent group docker | cut -d: -f3

#volumes PERMISSAO para backups e restore
sudo setfacl -R -m u:1100:rwx /srv/docker/volumes/nextcloud_*
sudo setfacl -R -m d:u:1100:rwx /srv/docker/volumes/nextcloud_*

#backups
sudo chown -R 1100:1100 /srv/backups; sudo chmod -R 750 /srv/backups

# Volume nomeado (duplicati-data)  precisa de escrita
docker volume inspect duplicati_duplicati-data
# verifique o Mountpoint e ajuste se necessário:
sudo chown -R 1100:1100 /var/lib/docker/volumes/duplicati_duplicati-data/_data




#Recomendação adicional: Considere usar UIDs/GIDs na faixa 1000-2000 para serviços, mantendo separação clara dos usuários normais do sistema.


