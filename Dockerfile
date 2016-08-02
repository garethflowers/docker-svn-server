FROM alpine:latest

RUN apk update \
    && apk add subversion \
    && mkdir /var/opt/svn
    
EXPOSE 3690

VOLUME /var/opt/svn

CMD [ "/usr/bin/svnserve", "-d", "-r", "/var/opt/svn" ]
