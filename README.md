# SVN Server

A simple Subversion server, using `svnserve`

## How to use this image

### Start a Subversion Server instance
To start a container, with data stored in /home/svn on the host, use the following:
```sh
docker run --name some-svn-server -d -v /home/svn:/var/opt/svn \
           -p 3690:3690 garethflowers/svn-server
```

### Creating a new Repository
Use `svnadmin create` within your container to create and manage respositories.

To create a repository called `new-repo` in `some-svn-server` container, use the following:
```sh
docker exec -it some-svn-server svnadmin create new-repo
```
