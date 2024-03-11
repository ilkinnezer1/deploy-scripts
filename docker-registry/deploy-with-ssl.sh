echo "load env.."
. env-with-ssl.sh \
bash ../remove.sh "$CONTAINER_NAME"
docker run \
  --rm \
  --entrypoint htpasswd \
  httpd:2 -Bbn $USERNAME $PASSWORD >> /var/docker/$CONTAINER_NAME/auth/.htpasswd

docker run --rm \
-v $CERT_DIR:/export \
alpine/openssl \
req -new -newkey rsa:4096 -days 365 -nodes -x509 \
-subj '/CN=${DOMAIN}/O=${COMPANY}/C=US' \
-keyout /export/${DOMAIN}.key \
-out /export/${DOMAIN}.crt

docker run --detach \
  --restart unless-stopped \
  --name "$CONTAINER_NAME" \
  --network="$NETWORK" \
  -v /var/docker/$CONTAINER_NAME/auth:/auth \
  -e "REGISTRY_AUTH=htpasswd" \
  -e "REGISTRY_AUTH_HTPASSWD_REALM=registry-realm" \
  -e REGISTRY_AUTH_HTPASSWD_PATH=/auth/.htpasswd \
  -e REGISTRY_HTTP_TLS_CERTIFICATE=${CERT_DIR}/${DOMAIN}.crt \
  -e REGISTRY_HTTP_TLS_KEY=${CERT_DIR}/${DOMAIN}.key \
  --volume ${CERT_DIR}:${CERT_DIR} \
  registry:"$VERSION"
