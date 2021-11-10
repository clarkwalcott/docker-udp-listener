# udplistener

Docker image that listens on a specified UDP port, outputs to container log. Forked from [mendhak/docker-udp-listener](https://github.com/mendhak/docker-udp-listener)

### Start it

By default, you can run it like this

    docker run -p 0.0.0.0:5005:5005 -p 0.0.0.0:5005:5005/udp --name udp-listener udplistener

You can make it listen on another port

    docker run -p 0.0.0.0:4444:4444 -p 0.0.0.0:4444:4444/udp -e UDPPORT=4444 --name udp-listener udplistener

#### Test it

In another terminal:

    nc -u localhost 5005

And start sending data.  You should see your text reflected in the `docker run` terminal


### Docker Compose

```
udp:
  container_name: my-udp-listener
  image: udplistener
  environment:
    - UDPPORT=4001
  ports:
  - "0.0.0.0:4001:4001"
  - "0.0.0.0:4001:4001/udp"

```

View its logs:

    docker logs my-udp-listener

Note: if container_name is omitted, container name is the {application_name}_{block_name} e.g. app_udp
