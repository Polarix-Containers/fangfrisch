#!/bin/sh

while ${INITIALIZED}; do
    /app/fangfrisch --conf /etc/fangfrisch.conf refresh
    sleep ${INTERVAL}
done

echo "Initialize your database with /app/fangfrisch initdb and set INITIALIZED=true"
sleep infinity
