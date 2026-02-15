#!/bin/bash

docker run --detach --restart unless-stopped \
  --network main \
  --name minio \
  -p 9000:9000 \
  -p 9001:9001 \
  -v /var/docker/minio/data:/data \
jumpserver/minio:latest server /data --console-address ":9001"
