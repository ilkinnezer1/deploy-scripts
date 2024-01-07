echo "load env.."
. env.sh
bash ../remove.sh "$CONTAINER_NAME"
sudo docker run --detach \
  --name "$CONTAINER_NAME" \
  --publish 80:80 \
  --network="$NETWORK" \
  --volume "$LOG_PATH":/var/log/nginx \
  --volume "$WEB_PATH":/usr/share/nginx/html \
  --volume "$CONFIG_PATH":/etc/nginx/conf.d \
  --volume "$ROOT_PATH"/nginx.conf:/etc/nginx/nginx.conf:ro \
  --volume "$IP_DB"/country.dat:/etc/nginx/country.dat:ro \
  --volume "$IP_DB"/city.dat:/etc/nginx/city.dat:ro \
  --restart unless-stopped \
  nginx:"$VERSION"
