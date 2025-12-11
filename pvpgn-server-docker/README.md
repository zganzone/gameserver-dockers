docker build --no-cache -t pvpgn:latest .

# Създаване на директории на хоста
mkdir -p etc var

# Стартиране на контейнера с mount
docker run -d --name pvpgn --net=host \
    -v $(pwd)/etc:/etc/pvpgn \
    -v $(pwd)/var:/var/pvpgn \
    pvpgn:latest
    

#docker run -d --name pvpgn --net=host      --ip 192.168.88.146    -v /home/pavtop/Documents/Games/game-servers/pvpgn-server-docker/etc:/usr/local/etc/pvpgn     -v /home/pavtop/Documents/Games/game-servers/pvpgn-server-docker/var:/usr/local/var/pvpgn    


--------------
docker load -i d2gslinux.tar
mkdir conf
docker cp DOCKERID:/root/.wine/drive_c/d2gs/start.sh .conf/start.sh
docker cp DOCKERID:/root/.wine/drive_c/d2gs/d2gs.reg .conf/d2gs.reg
docker stop 

Edit conf/d2gs.reg Set "D2CSIP" and "D2DBSIP" to server IP of docker host


  docker run -d --name d2gs     -v /home/pavtop/Documents/Games/game-servers/d2gs-configs/start.sh:/root/.wine/drive_c/d2gs/start.sh     -v /home/pavtop/Documents/Games/game-servers/d2gs-configs/d2gs.reg:/root/.wine/drive_c/d2gs/d2gs.reg     d2gs:1.14d

