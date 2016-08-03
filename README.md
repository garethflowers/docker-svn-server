# SVN Server

A simple Subversion server, using `svnserve`

## How to use this image

### Start a Subversion Server instance
To start a container, with data stored in /home/svn on the host, use the following:
```
docker run --name some-svn-server -d -v /home/svn:/var/opt/svn \
           -p 3690:3690 garethflowers/svn-server
```
