#!/bin/bash
set -e

# Проверка и копиране на дефолтни конфигурации
if [ ! -f /etc/pvpgn/bnetd.conf ]; then
    echo "Copying default /etc/pvpgn..."
    mkdir -p /etc/pvpgn
    cp -r /defaults/etc/* /etc/pvpgn/
fi

if [ ! -f /var/pvpgn/users.dat ]; then
    echo "Copying default /var/pvpgn..."
    mkdir -p /var/pvpgn
    cp -r /defaults/var/* /var/pvpgn/
fi

# Стартираме всички нужни сървиси в foreground
echo "Starting PvPGN services..."

bnetd -f &
sleep 1
d2cs &
sleep 1
d2dbs &
sleep 1
/usr/local/pvpgn/sbin/bntrackd \
    -l /var/pvpgn/bntrackd.log \
    -o /var/pvpgn/games.txt \
    -u 3 -x -c true &

# Очакваме всички процеси да работят (foreground)
wait
