#!/bin/bash

# Ако /etc/pvpgn е празна -> копираме дефолтните
if [ ! -f /etc/pvpgn/bnetd.conf ]; then
    echo "Copying default /etc/pvpgn..."
    mkdir -p /etc/pvpgn
    cp -r /defaults/etc/* /etc/pvpgn/
fi

# Ако /var/pvpgn е празна -> копираме дефолтните
if [ ! -f /var/pvpgn/users.dat ]; then
    echo "Copying default /var/pvpgn..."
    mkdir -p /var/pvpgn
    cp -r /defaults/var/* /var/pvpgn/
fi

# Стартира PvPGN
echo "Starting PvPGN..."
exec "$@"
