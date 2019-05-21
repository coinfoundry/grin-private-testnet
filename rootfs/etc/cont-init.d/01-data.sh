#!/bin/sh

if [ ! -d /data ]; then
    mkdir /data
fi

if [ ! -d /data/node-1 ]; then
    mkdir /data/node-1
fi

if [ ! -d /data/node-2 ]; then
    mkdir /data/node-2
fi
