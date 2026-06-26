#!/bin/bash

SERVER=$1

mkdir -p ssh/$SERVER

ssh-keygen \
    -t rsa \
    -b 4096 \
    -N "" \
    -f ssh/$SERVER/id_rsa
    