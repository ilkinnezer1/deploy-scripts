#!/bin/bash

echo "load env.."
. env.sh
bash ../remove.sh $CONTAINER_NAME
docker run -d --privileged --restart unless-stopped \
  --name $CONTAINER_NAME \
  --network $NETWORK \
  -p $EXPOSE_PORT:2049 \
  -e SHARED_DIRECTORY=/nfsshare \
  -v $DATA_PATH:/nfsshare \
  itsthenetwork/nfs-server-alpine:$VERSION
