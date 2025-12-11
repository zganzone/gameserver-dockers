FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y \
    git gcc g++ make cmake libmysqlclient-dev libmysqlclient21 zlib1g-dev libbz2-dev \
    && rm -rf /var/lib/apt/lists/*

# Клонираме PvPGN
RUN git clone https://github.com/pvpgn/pvpgn-magicbuilder.git /opt/pvpgn

WORKDIR /opt/pvpgn

RUN mkdir build && cd build && cmake .. && make && make install

# Създаваме дефолтни директории за copy
RUN mkdir -p /defaults/etc /defaults/var \
    && cp -r /usr/local/etc/pvpgn/* /defaults/etc/ \
    && cp -r /usr/local/var/pvpgn/* /defaults/var/

# Копираме entrypoint
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 6112 6113 4000

ENTRYPOINT ["/entrypoint.sh"]
