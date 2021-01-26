#!/bin/bash

set -e

if [ -e /etc/mm-wiki/firstrun ]; then
    rm -rf /etc/mm-wiki
    if [ ! -e /mm-wiki/conf/template.conf  ]; then
        echo `date "+%Y-%m-%d %H:%M:%S"`' >>>>>> setup mm-wiki service'
        tar -zxf /mm-wiki-linux-amd64.tar.gz -C /mm-wiki
        rm -f /mm-wiki-linux-amd64.tar.gz
        cd install
        ./install -port 8080
    else
        echo `date "+%Y-%m-%d %H:%M:%S"`' >>>>>> update mm-wiki service'
        tar -zxf /mm-wiki-linux-amd64.tar.gz -C /mm-wiki
        rm -f /mm-wiki-linux-amd64.tar.gz
        ./mm-wiki --conf conf/mm-wiki.conf --upgrade
    fi
else
    echo `date "+%Y-%m-%d %H:%M:%S"`' >>>>>> start mm-wiki service'
    ./mm-wiki --conf conf/mm-wiki.conf
fi