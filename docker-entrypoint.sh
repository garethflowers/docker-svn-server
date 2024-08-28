#!/bin/sh

set -e

# create a pipe for svnserve logs
rm -f /var/svn/svnlogs
mkfifo /var/svn/svnlogs

# run the SVN service in the background
/usr/bin/svnserve --daemon --root /var/opt/svn --log-file=/var/svn/svnlogs &
# remember the PID of the SVN server
SVNSERVE_PID=$!

# redirect svnserve logs to stdout
cat /var/svn/svnlogs

# stop the SVN server running in the background
kill -s SIGTERM $SVNSERVE_PID
