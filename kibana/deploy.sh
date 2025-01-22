docker run --detach --restart unless-stopped \
    --name kibana \
    --network main \
    --publish 5601:5601 \
    --env ELASTICSEARCH_HOSTS='["http://elasticsearch:9200"]' \
    --env ELASTICSEARCH_USERNAME="kibana" \
    --env ELASTICSEARCH_PASSWORD="-JvvAbT*Hy1UV8Pz9iJ0" \
docker.elastic.co/kibana/kibana:8.17.1
