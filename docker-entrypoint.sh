#!/bin/sh

set -e

/usr/bin/svnserve --daemon --foreground --root /var/opt/svn $SVNSERVE_ARGS
