echo "load env.."
. env.sh \
bash ../remove.sh "$CONTAINER_NAME"
docker run \
  --rm \
  --entrypoint htpasswd \
  httpd:2 -Bbn $USERNAME $PASSWORD >> $SERVICE_PATH/auth/.htpasswd

docker run -d \
    -v $SERVICE_PATH/config:/mnt/config \
    --name "$CONTAINER_NAME" \
    --restart unless-stopped \
    --network main \
    grafana/loki:$VERSION \
    -config.file=/mnt/config/$CONFIG_FILE
