#!/bin/sh

while ${INITIALIZED}; do
    sleep ${INTERVAL}
    /app/fangfrisch --conf /etc/fangfrisch.conf refresh
done

echo "Initialize your database with /app/fangfrisch initdb and set INITIALIZED=true"
sleep infinity