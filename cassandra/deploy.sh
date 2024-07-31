echo "load env.."

. $1.sh

bash ../remove.sh $CONTAINER_NAME

docker run --name $CONTAINER_NAME -d \
  --restart unless-stopped \
  --network=$NETWORK \
  -p $PORT:9042 \
  -e CASSANDRA_USER=$CASSANDRA_USER \
  -e CASSANDRA_PASSWORD=$CASSANDRA_PASSWORD \
  -v $DATA_PATH:/var/lib/cassandra \
  cassandra:$VERSION
