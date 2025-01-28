#!/bin/sh

set -e

# create a pipe for svnserve logs
rm -f /var/svn/svnlogs
mkfifo /var/svn/svnlogs

# run the SVN service in the background
/usr/bin/svnserve --daemon --foreground --root /var/opt/svn --log-file=/var/svn/svnlogs &
# remember the PID of the SVN server
SVNSERVE_PID=$!

# redirect SIGTERM to the SVN service
trap "kill -s SIGTERM $SVNSERVE_PID" SIGTERM

# redirect svnserve logs to stdout
while read -r line < /var/svn/svnlogs; do
	printf '%s\n' "$line"
done
