#!/bin/bash

echo "load env.."
. env.sh
bash ../remove.sh "$CONTAINER_NAME"
docker run -d \
  --restart unless-stopped \
  --publish 3306:3306 \
  --network=$NETWORK \
  --name $CONTAINER_NAME \
  -e MYSQL_ROOT_PASSWORD=$ROOT_PASSWORD \
  -e MYSQL_PASSWORD=yourStrongUserPassword \
  -v $DATA_PATH:/var/lib/mysql \
  mariadb:$VERSION
