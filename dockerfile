FROM node:16
USER root

ENV HOME=/root

RUN sed -i "s@http://deb.debian.org@http://mirrors.aliyun.com@g" /etc/apt/sources.list && apt update

RUN apt-get install openssh-server -y
RUN apt-get install nginx -y

RUN sed -i "s@#PermitRootLogin prohibit-password@PermitRootLogin yes@g" /etc/ssh/sshd_config

RUN echo 'tail -f /dev/null' >> ./start.sh
CMD service ssh start && bash ./start.sh
