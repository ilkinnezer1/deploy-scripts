echo "load env.."

. $1.sh

docker run --rm \
-v $CERTS_PATH:/export \
alpine/openssl \
req -new -newkey rsa:4096 -days 365 -nodes -x509 \
-subj '/CN=www.mydom.com/O=MyCompany/C=US' \
-keyout /export/pgbouncer.key \
-out /export/pgbouncer.crt

bash ../remove.sh "$CONTAINER_NAME"
sudo docker run --detach \
  --network="$NETWORK" \
  --name "$CONTAINER_NAME" \
  --env=PGBOUNCER_DATABASE="$PGBOUNCER_DATABASE" \
  --env=POSTGRESQL_HOST="$POSTGRESQL_HOST" \
  --env=POSTGRESQL_PORT="$POSTGRESQL_PORT" \
  --env=POSTGRESQL_USERNAME="$POSTGRESQL_USERNAME" \
  --env=POSTGRESQL_PASSWORD="$POSTGRESQL_PASSWORD" \
  --env=PGBOUNCER_CLIENT_TLS_SSLMODE="$PGBOUNCER_CLIENT_TLS_SSLMODE" \
  --env=PGBOUNCER_CLIENT_TLS_CERT_FILE=/opt/bitnami/pgbouncer/certs/pgbouncer.crt \
  --env=PGBOUNCER_CLIENT_TLS_KEY_FILE=/opt/bitnami/pgbouncer/certs/pgbouncer.key \
  --volume "$CERTS_PATH":/opt/bitnami/pgbouncer/certs \
  --restart unless-stopped \
  bitnami/pgbouncer:"$VERSION"
