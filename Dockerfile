FROM alpine:3.14.3

CMD [ "/usr/bin/svnserve", "--daemon", "--foreground", "--root", "/var/opt/svn" ]
EXPOSE 3690
HEALTHCHECK CMD netstat -ln | grep 3690 || exit 1
VOLUME [ "/var/opt/svn" ]
WORKDIR /var/opt/svn

RUN apk add --no-cache \
	subversion==1.14.2-r0\
	wget==1.21.1-r1
