#!/bin/sh
if [ -n "$FLAG" ]; then
    echo "$FLAG" > /home/ctf/flag.txt
    echo "$FLAG" > /home/admin/flag.txt
    chmod 444 /home/ctf/flag.txt /home/admin/flag.txt
fi

exec /usr/sbin/sshd -D -e