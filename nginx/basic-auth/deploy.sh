echo "load env.."
. env.sh

docker run \
  --rm \
  --entrypoint htpasswd \
  httpd:2 -Bbn $USERNAME $PASSWORD >> $NGINX_CONFIG_PATH/auth/$APP_NAME/.htpasswd
