# SVN Server

A simple Subversion server, using `svnserve`.

## How to use this image

### Start a Subversion Server instance

To start a container, with data stored in `/home/svn` on the host, use the
following:
```sh
docker run --name some-svn-server \
           --detach \
           --volume /home/svn:/var/opt/svn \
           --publish 3690:3690 \
           garethflowers/svn-server
```

### Creating a new Repository

Use `svnadmin` within your container to create and manage repositories.

For example, to create a repository called `new-repo` in container
`some-svn-server`, use the following:
```sh
docker exec -it some-svn-server svnadmin create new-repo
```

## License

* Apache Subversion is released under the [Apache License][1]
* This image is released under the [MIT License][2]

 [1]: http://www.apache.org/licenses/LICENSE-2.0
 [2]: https://raw.githubusercontent.com/garethflowers/docker-svn-server/master/LICENSE
