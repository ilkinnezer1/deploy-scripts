echo "load env.."
. env.sh
bash ../remove.sh $CONTAINER_NAME
sudo docker run --detach --restart unless-stopped \
  --name $CONTAINER_NAME \
  --publish 443:443 \
  --publish 80:80 \
  --network $NETWORK \
  --volume $ROOT_PATH/nginx.conf:/etc/nginx/nginx.conf:ro \
  --volume $CONFIG_PATH:/etc/nginx/conf.d \
  --volume $LOG_PATH:/var/log/nginx \
  --volume $CERTS_PATH:/etc/nginx/ssl \
  --volume $WEB_PATH:/usr/share/nginx/html \
  --volume $IP_DB/country.dat:/etc/nginx/country.dat:ro \
  --volume $IP_DB/city.dat:/etc/nginx/city.dat:ro \
  nginx:$VERSION
