echo "load env.."

. $1.sh

bash ../remove.sh "$CONTAINER_NAME"

sudo docker run --detach \
  --restart unless-stopped \
  --network="$NETWORK" \
  --publish 6379:6379 \
  --name "$CONTAINER_NAME" \
  --volume "$DATA_PATH":/data \
  --env REDIS_PASSWORD="$REDIS_PASSWORD" \
  redis:"$VERSION" \
redis-server --appendonly yes  --requirepass "$REDIS_PASSWORD"
