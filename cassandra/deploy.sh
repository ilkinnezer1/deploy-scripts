echo "load env.."

. $1.sh

bash ../remove.sh $CONTAINER_NAME

docker run -d --restart unless-stopped \
  --network=$NETWORK \
  --publish $PORT:9042 \
  --name $CONTAINER_NAME  \
  -e CASSANDRA_CLUSTER_NAME=$CASSANDRA_CLUSTER_NAME \
  -e CASSANDRA_USER=$CASSANDRA_USER \
  -e CASSANDRA_PASSWORD=$CASSANDRA_PASSWORD \
  -v $DATA_PATH:/var/lib/cassandra \
  cassandra:$VERSION
