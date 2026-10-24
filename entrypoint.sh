#!/bin/sh
# Update flag.txt at container start time (when START_TIME flag injection is enabled)
if [ -n "$FLAG" ]; then
    echo "$FLAG" > /app/flag.txt
    cp /app/flag.txt /flag.txt
fi

cd /app
# Expose shell over TCP on both port 80 and port 1337
nc -lk -p 80 -e /bin/sh &
exec nc -lk -p 1337 -e /bin/sh
