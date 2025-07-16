echo "load env.."
. env.sh

docker run --rm \
-v $CERTS_PATH:/export \
alpine/openssl \
req -new -newkey rsa:2048 -days 5475 -nodes -x509 \
  -subj "/CN=*/ST=State/O=Organization/C=US" \
  -keyout /export/vault.key \
  -out /export/vault.crt \

bash ../remove.sh $CONTAINER_NAME
docker run -d --restart unless-stopped \
  --cap-add=IPC_LOCK \
  --network $NETWORK \
  --name $CONTAINER_NAME \
  -p $EXPOSE_PORT:8200 \
  -p $EXPOSE_CLUSTER_PORT:8201 \
  -v $CONFIG_PATH:/vault/config \
  -v $DATA_PATH:/vault/data \
  -v $CERTS_PATH:/vault/certs \
  hashicorp/vault:$VERSION \
  vault server -config=/vault/config/$CONFIG_FILENAME
chmod -R a+rwx "$SERVICE_PATH"
