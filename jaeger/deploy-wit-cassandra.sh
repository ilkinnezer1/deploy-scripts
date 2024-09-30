echo "load env.."
. env.sh
bash ../remove.sh jaeger

sudo docker run --rm \
  --network $NETWORK \
  -e CQLSH_HOST=$CQLSH_HOST \
  -e CQLSH_PORT=$CQLSH_PORT \
  -e KEYSPACE=$KEYSPACE \
  -e CASSANDRA_USERNAME=$CASSANDRA_USERNAME \
  -e CASSANDRA_PASSWORD=$CASSANDRA_PASSWORD \
  jaegertracing/jaeger-cassandra-schema:$VERSION \
  -migrate -timeout=15s


sudo docker run -d --restart unless-stopped \
  --network $NETWORK \
  -p 16686:16686 \
  -p 4317:4317 \
  -p 4318:4318 \
  -e COLLECTOR_OTLP_ENABLED=true \
  -e SPAN_STORAGE_TYPE=cassandra \
  -e CASSANDRA_SERVERS=$CASSANDRA_SERVERS \
  -e CASSANDRA_KEYSPACE=$KEYSPACE \
  -e CASSANDRA_PORT=$CASSANDRA_PORT \
  -e CASSANDRA_USERNAME=$CASSANDRA_USERNAME \
  -e CASSANDRA_PASSWORD=$CASSANDRA_PASSWORD \
  --name jaeger \
  jaegertracing/all-in-one:$VERSION
