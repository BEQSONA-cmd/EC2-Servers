#!/bin/bash

mkdir -p /home/ubuntu/.ssh

cp /ssh/id_rsa.pub /home/ubuntu/.ssh/authorized_keys

chown -R ubuntu:ubuntu /home/ubuntu/.ssh

chown -R ubuntu:ubuntu /home/ubuntu

chmod 700 /home/ubuntu/.ssh
chmod 600 /home/ubuntu/.ssh/authorized_keys
chmod 750 /home/ubuntu

exec /usr/sbin/sshd -D