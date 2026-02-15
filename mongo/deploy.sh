#!/bin/bash

echo "load env.."

. $1.sh

bash ../remove.sh $CONTAINER_NAME

docker run -d \
    --network="$NETWORK" \
    --publish $PORT:27017 \
    --restart unless-stopped \
    --name $CONTAINER_NAME \
    -v $DATA_PATH:/data/db \
    --env=MONGO_INITDB_ROOT_USERNAME=$MONGO_ROOT_USER \
    --env=MONGO_INITDB_ROOT_PASSWORD=$MONGO_ROOT_PASSWORD \
    mongo:"$VERSION"
