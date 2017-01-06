FROM alpine:latest

RUN apk add --no-cache subversion && \
    rm -fr /var/cache/apk/*

WORKDIR /var/opt/svn

VOLUME [ "/var/opt/svn" ]

EXPOSE 3690

CMD [ "/usr/bin/svnserve", "--daemon", "--foreground", "--root", "/var/opt/svn" ]
