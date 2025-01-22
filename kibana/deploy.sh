docker run --detach --restart unless-stopped \
    --name $CONTAINER_NAME \
    --network $NETWORK \
    --publish $PORT:5601 \
    --env ELASTICSEARCH_HOSTS=$ELASTICSEARCH_HOSTS \
    --env ELASTICSEARCH_USERNAME=$ELASTICSEARCH_USERNAME \
    --env ELASTICSEARCH_PASSWORD=$ELASTICSEARCH_PASSWORD \
docker.elastic.co/kibana/kibana:$VERSION
