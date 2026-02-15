#!/bin/bash

echo "load env.."

. $1.sh

bash ../remove.sh "$CONTAINER_NAME"
sudo docker run --detach --restart unless-stopped \
  --network="$NETWORK" \
  --publish "$PORT":5432 \
  --name "$CONTAINER_NAME" \
  --env=POSTGRES_PASSWORD="$POSTGRES_PASSWORD" \
  --env=POSTGRES_USER="$POSTGRES_USER" \
  --volume "$DATA_PATH":/var/lib/postgresql/data \
  postgres:"$VERSION"
