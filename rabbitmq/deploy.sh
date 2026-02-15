#!/bin/bash

echo "load env.."

. $1.sh

bash ../remove.sh "$CONTAINER_NAME"

sudo docker run --detach --restart unless-stopped \
  --network="$NETWORK" \
  --publish 15692:15692 \
  --publish 15672:15672 \
  --publish 5672:5672 \
  --name "$CONTAINER_NAME" \
  --env RABBITMQ_DEFAULT_USER="$RABBITMQ_DEFAULT_USER" \
  --env RABBITMQ_DEFAULT_PASS="$RABBITMQ_DEFAULT_PASS" \
  --env RABBITMQ_NODENAME="$HOST_NAME" \
  --volume "$DATA_PATH":/var/lib/rabbitmq/mnesia \
  --volume "$LOG_PATH":/var/log/rabbitmq \
  rabbitmq:"$VERSION"
chmod -R a+rwx "$SERVICE_PATH"  
