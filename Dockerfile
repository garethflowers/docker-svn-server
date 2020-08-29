FROM alpine:3.12.0

LABEL org.opencontainers.image.authors="Gareth Flowers" \
	org.opencontainers.image.description="Subversion Server" \
	org.opencontainers.image.licenses="MIT" \
	org.opencontainers.image.title="svn-server" \
	org.opencontainers.image.url="https://github.com/garethflowers/docker-svn-server" \
	org.opencontainers.image.vendor="garethflowers"

CMD [ "/usr/bin/svnserve", "--daemon", "--foreground", "--root", "/var/opt/svn" ]
EXPOSE 3690
HEALTHCHECK CMD netstat -ln | grep 3690 || exit 1
VOLUME [ "/var/opt/svn" ]
WORKDIR /var/opt/svn

RUN apk add --no-cache \
	subversion==1.13.0-r2 \
	wget==1.20.3-r1
