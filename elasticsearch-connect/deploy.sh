docker run --detach --restart unless-stopped --tty \
    --network main \
    --name elasticsearch-connector-mongodb-training \
    --volume "/var/docker/elastic-connectors:/config" \
    docker.elastic.co/integrations/elastic-connectors:8.17.1 \
    /app/bin/elastic-ingest \
    -c /config/config.yml
