#!/bin/sh

while ${INITIALIZED}:
    sleep ${INTERVAL}
    /app/fangfrisch --conf /etc/fangfrisch.conf refresh