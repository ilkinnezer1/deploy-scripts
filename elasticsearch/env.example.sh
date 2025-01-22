VERSION="8.17.1"
NETWORK=main
PORT=9200

CONTAINER_NAME=elasticsearch
NODE_NAME=esmaster

ELASTIC_PASSWORD="superpassword"
LIMIT_MEMORY=4g # Max limit for container
ES_JAVA_OPTS="-Xms1g -Xmx1g" # Limit for Heap

SERVICE_PATH="/var/docker/$CONTAINER_NAME"
DATA_PATH="$SERVICE_PATH/data"
LOGS_PATH="$SERVICE_PATH/logs"
