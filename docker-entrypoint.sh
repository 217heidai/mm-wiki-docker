#!/bin/sh

set -e

if [ ! -e /mm-wiki/conf/template.conf  ]; then
    tar -zxf /mm-wiki-linux-amd64.tar.gz -C /mm-wiki
    rm -f /mm-wiki-linux-amd64.tar.gz
    cd install
    ./install -port 8080
else
    ./mm-wiki --conf conf/mm-wiki.conf
fi