FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    openssh-server \
    sudo \
    curl \
    git \
    vim \
    nano \
    wget \
    unzip

RUN mkdir /var/run/sshd

RUN echo "ubuntu ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

EXPOSE 22

CMD ["/entrypoint.sh"]
