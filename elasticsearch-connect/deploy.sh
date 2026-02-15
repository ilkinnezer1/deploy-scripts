#!/bin/bash

echo "load env.."

. $1.sh

bash ../remove.sh "$CONTAINER_NAME"

docker run --detach --restart unless-stopped --tty \
    --network $NETWORK \
    --name $CONTAINER_NAME \
    --volume "$CONFIG_PATH:/config" \
    docker.elastic.co/integrations/elastic-connectors:$VERSION \
    /app/bin/elastic-ingest \
    -c /config/$CONFIG_FILE
