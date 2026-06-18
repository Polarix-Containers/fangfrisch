#!/bin/sh

while ${INITIALIZED}:
    sleep ${INTERVAL}
    /app/fangfrisch --conf /etc/fangfrisch.conf refresh

echo "Initialize your database with /app/fangfrisch initdb and set INITIALIZED=True"
sleep infinity