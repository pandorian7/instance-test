#!/bin/sh
# Start-time flag injection: FLAG env var passed to docker run
echo "${FLAG:-not-set-at-start}" > /usr/share/nginx/html/runtime-flag.txt