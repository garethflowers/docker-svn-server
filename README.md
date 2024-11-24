# SVN Server

A simple Subversion server, using `svnserve`.

## How to use this image

### Start a Subversion Server instance

To start a container, with data stored in `/home/svn` on the host, use the
following:

#### ...via `docker run`

```sh
docker run \
    --name my-svn-server \
    --detach \
    --volume /home/svn:/var/opt/svn \
    --publish 3690:3690 \
    garethflowers/svn-server
```

#### ...via `docker compose`

```sh
services:
  svn:
    image: garethflowers/svn-server
    ports:
      - 3690:3690/tcp
    volumes:
      - /home/svn:/var/opt/svn
```

### Start the Subversion server with custom arguments

To define arguments to be passed to the Subversion server, set the `SVNSERVE_ARGS` environmental variable:

#### ...via `docker run`

```sh
docker run ... SVNSERVE_ARGS="--option1 value1 --option2 value2" ... garethflowers/svn-server
```

#### ...via `docker compose`

```sh
services:
  svn:
    image: garethflowers/svn-server
    environment:
      - SVNSERVE_ARGS=--option1 value1 --option2 value2
    ...
```

### List available command line options

```sh
docker exec -it CONTAINER_NAME svnserve --help
```

### Creating a new SVN Repository

Use `svnadmin` within your container to create and manage repositories.

For example, to create a repository called `new-repo` in container
`my-svn-server`, use the following:

```sh
docker exec -it my-svn-server svnadmin create new-repo
```

## License

-   Apache Subversion is released under the
    [Apache License](https://www.apache.org/licenses/LICENSE-2.0).
-   This image is released under the
    [MIT License](https://raw.githubusercontent.com/garethflowers/docker-svn-server/master/LICENSE).
