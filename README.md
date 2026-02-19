sudo groupadd -g 1100 duplicati-data
sudo useradd -u 1100 -g 1100 -r -s /usr/sbin/nologin duplicati-data

sudo chown root:1100 /srv/docker/volumes; sudo chmod 751 /srv/docker/volumes
sudo chown 1100:1100 /srv/backups; sudo chmod 750 /srv/backups

# Volume nomeado (duplicati-data)  precisa de escrita
docker volume inspect duplicati_duplicati-data
# verifique o Mountpoint e ajuste se necessário:
sudo chown -R 1100:1100 /var/lib/docker/volumes/duplicati_duplicati-data/_data




#Recomendação adicional: Considere usar UIDs/GIDs na faixa 1000-2000 para serviços, mantendo separação clara dos usuários normais do sistema.
