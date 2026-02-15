#!/bin/bash

echo "load env.."
. env.sh

# Remove the container if it exists
bash ../remove.sh "$CONTAINER_NAME"

sudo docker run -d \
   --name "$CONTAINER_NAME" \
   --net "$NETWORK" \
   -p 80:80 \
   -p 8404:8404 \
   -v $CONFIG_PATH:/usr/local/etc/haproxy:ro \
   haproxy:2.9.6-alpine3.19
