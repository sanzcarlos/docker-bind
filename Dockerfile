FROM alpine

MAINTAINER Carlos Sanz <carlos.sanzpenas@gmail.com>

LABEL org.label-schema.vendor = "Personal" \
      org.label-schema.name = "Bind" \
      org.label-schema.version = "9.12.2_p1-r0" \
      org.label-schema.docker.cmd = "docker run -p 53:53 sanzcarlos/bind:alpine" \
      org.label-schema.url = "https://pkgs.alpinelinux.org/packages?name=bind&branch=edge" \
      org.label-schema.build-date = "2018-10-21"

RUN apk update && \
    apk upgrade && \
    apk add bind && \
    rm -rf /var/cache/apk/* \\
    touch /etc/bind/named.conf

EXPOSE 53/udp
EXPOSE 53/tcp

CMD["/usr/sbin/named -g"]
