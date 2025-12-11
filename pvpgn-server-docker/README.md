docker build --no-cache -t pvpgn:latest .

# Създаване на директории на хоста
mkdir -p etc var

# Стартиране на контейнера с mount
docker run -d --name pvpgn --net=host \
    -v $(pwd)/etc:/etc/pvpgn \
    -v $(pwd)/var:/var/pvpgn \
    pvpgn:latest
    
