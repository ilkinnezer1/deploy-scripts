#!/bin/bash

echo "load env.."
. env.sh \
bash ../remove.sh "$CONTAINER_NAME"
mkdir -p /var/docker/$CONTAINER_NAME/auth
docker run \
  --rm \
  --entrypoint htpasswd \
  httpd:2 -Bbn $USERNAME $PASSWORD >> /var/docker/$CONTAINER_NAME/auth/.htpasswd

docker run --detach \
  --restart unless-stopped \
  --name "$CONTAINER_NAME" \
  --network="$NETWORK" \
  -v /var/docker/$CONTAINER_NAME/auth:/auth \
  -e "REGISTRY_AUTH=htpasswd" \
  -e "REGISTRY_AUTH_HTPASSWD_REALM=registry-realm" \
  -e REGISTRY_AUTH_HTPASSWD_PATH=/auth/.htpasswd \
  -e REGISTRY_STORAGE_DELETE_ENABLED=true \
  --publish 5000:5000 \
  registry:"$VERSION"
