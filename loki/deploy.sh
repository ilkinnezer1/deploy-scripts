echo "load env.."
. env.sh

# Ensure the NGINX authentication path for the container exists
mkdir -p $NGINX_AUTH_PATH/$CONTAINER_NAME

# Remove the container if it exists
bash ../remove.sh "$CONTAINER_NAME"

# Create or update the .htpasswd file
docker run \
  --rm \
  --entrypoint htpasswd \
  httpd:2 -Bbn $USERNAME $PASSWORD >> $NGINX_AUTH_PATH/$CONTAINER_NAME/.htpasswd

# Run the Loki container
docker run -d \
    -v $CONFIG_PATH:/mnt/config \
    -v $DATA_PATH:/loki \
    --name "$CONTAINER_NAME" \
    --restart unless-stopped \
    --log-opt max-size=3G \
    --log-opt max-file=3 \
    --network main \
    grafana/loki:$VERSION \
    -config.file=/mnt/config/$CONFIG_FILE

# Update permissions for the SERVICE_PATH/data
chmod -R a+rwx $SERVICE_PATH/data
