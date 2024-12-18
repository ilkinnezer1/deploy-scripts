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
docker run -d --restart unless-stopped --cap-add=IPC_LOCK \
  --network $NETWORK \
  --name $CONTAINER_NAME \
  -p $EXPOSE_PORT:8200 \
  -v $CONFIG_PATH:/vault/config \
  -v $CERTS_PATH:/vault/certs \
  -v $DATA_PATH:/vault/data \
  -e VAULT_SKIP_VERIFY=true \
  hashicorp/vault:$VERSION \
  server
chmod -R a+rwx "$SERVICE_PATH"
