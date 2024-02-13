echo "load env.."

. $1.sh

bash ../remove.sh "$CONTAINER_NAME"
sudo docker run -d \
  --restart unless-stopped \
  --network="$NETWORK" \
  --name="$CONTAINER_NAME" \
  -v $CONFIGS_PATH:/fluent-bit/etc \
  -e LOKI_URL="$LOKI_DOMAIN/loki/api/v1/push" \
  grafana/fluent-bit-plugin-loki:$VERSION
