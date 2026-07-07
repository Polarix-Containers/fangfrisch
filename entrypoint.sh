#!/bin/sh

while ${INITIALIZED}; do
    /usr/local/bin/fangfrisch --conf /etc/fangfrisch.conf refresh
    sleep "${INTERVAL}"
done

# shellcheck disable=SC2006
echo "Initialize your database with `fangfrisch initdb` and set INITIALIZED=true"
sleep infinity
