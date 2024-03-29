ARG dist
ARG ver

FROM ${dist}:${ver}
LABEL maintainer="Yasuyuki YAMADA <yasuyuki.ymd@gmail.com>"

RUN apt-get -y update && apt-get -y install openssh-server rsyslog less vim sudo tzdata
RUN mkdir -p /var/run/sshd /root/.ssh
RUN echo 'root:root' | chpasswd

RUN sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
EXPOSE 22

CMD ["/sbin/init"]
