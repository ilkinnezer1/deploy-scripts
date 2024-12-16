NETWORK="main"
CONTAINER_NAME="nginx"
VERSION="stable-alpine3.17"

ROOT_PATH="/var/docker/nginx"
LOG_PATH="/var/log/nginx"

CONFIG_PATH="$ROOT_PATH/config"
CERTS_PATH="$ROOT_PATH/ssl"
IP_DB="$ROOT_PATH/ip-db"
WEB_PATH="$ROOT_PATH/data"
