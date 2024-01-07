docker run \
    --name docker-hoster \
    --detach \
    --restart unless-stopped \
    -v /var/run/docker.sock:/tmp/docker.sock \
    -v /etc/hosts:/tmp/hosts \
dvdarias/docker-hoster
