echo "load env.."
. env.sh
bash ../remove.sh $CONTAINER_NAME

sudo docker run --detach --restart unless-stopped --memory=$LIMIT_MEMORY \
    --name $CONTAINER_NAME \
    --network $NETWORK \
    --publish $PORT:9200 \
    --env ELASTIC_PASSWORD=$ELASTIC_PASSWORD \
    --env node.name=$NODE_NAME \
    --env discovery.type="single-node" \
    --env "ES_JAVA_OPTS=$ES_JAVA_OPTS" \
    --env bootstrap.memory_lock=true \
    --env xpack.security.enabled=true \
    --env xpack.security.http.ssl.enabled=false \
    --env xpack.security.transport.ssl.enabled=false \
    --volume $DATA_PATH:/usr/share/elasticsearch/data \
    --volume $LOGS_PATH:/usr/share/elasticsearch/logs \
    docker.elastic.co/elasticsearch/elasticsearch:$VERSION
chmod -R a+rwx "$SERVICE_PATH"
