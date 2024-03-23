echo "load env.."
. env.sh

# Remove the container if it exists
bash ../remove.sh "$CONTAINER_NAME"

sudo docker run --detach \
  --restart unless-stopped \
  --network="$NETWORK" \
  --name "$CONTAINER_NAME" \
  --env NGINX_PROXY_PASS_URL="$NGINX_PROXY_PASS_URL" \
  --env REGISTRY_TITLE="$REGISTRY_TITLE" \
  --env REGISTRY_SECURED=false \
  --env SINGLE_REGISTRY=true \
  --env DELETE_IMAGES=true \
  --env SHOW_CONTENT_DIGEST=true \
  --env SHOW_CATALOG_NB_TAGS=true \
  --env CATALOG_ELEMENTS_LIMIT=1000 \
  --env CATALOG_MIN_BRANCHES=1 \
  --env CATALOG_MAX_BRANCHES=1 \
  --env TAGLIST_PAGE_SIZE=100 \
joxit/docker-registry-ui:"$VERSION"
