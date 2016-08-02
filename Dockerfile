FROM alpine:latest
MAINTAINER garethflowers

RUN apk update \
    && apk add subversion \
    && mkdir -p /var/opt/svn

VOLUME /var/opt/svn
    
EXPOSE 3690

CMD [ "/usr/bin/svnserve", "--daemon", "--root", "/var/opt/svn" ]
