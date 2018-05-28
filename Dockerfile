FROM alpine:3.7

LABEL maintainer=garethflowers \
	name=svn-server \
	version=1.0.0

CMD [ "/usr/bin/svnserve", "--daemon", "--foreground", "--root", "/var/opt/svn" ]
EXPOSE 3690
HEALTHCHECK CMD netstat -ln | grep 3690 || exit 1
VOLUME [ "/var/opt/svn" ]
WORKDIR /var/opt/svn

RUN apk add --no-cache subversion && \
	rm -fr /var/cache/apk/*
