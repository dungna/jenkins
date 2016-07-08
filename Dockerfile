# Jenkins slave Centos          
FROM nguyenanhdung/centos7:v1

MAINTAINER nguyenanhdung <dungna@outlook.com>

# Config SSH
RUN sshd-keygen
RUN sed -i "s/#UsePrivilegeSeparation.*/UsePrivilegeSeparation no/g" /etc/ssh/sshd_config && sed -i "s/UsePAM.*/UsePAM no/g" /etc/ssh/sshd_config

# Setup default user
RUN useradd dungna -G wheel -s /bin/bash -m
RUN echo 'dungna:dungna' | chpasswd
RUN echo '%wheel ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

# expose ports for ssh
EXPOSE 22

# Workspace for Docker
WORKDIR /home/dungna

# Start SSH-server
CMD ["/usr/sbin/sshd", "-D"]
