README
======

```bash
CONTAINER_NAME='mariadb'
IMAGE_NAME='pabra/mariadb'

# kill eventually running containers with same name
docker ps \
    --filter name=^/${CONTAINER_NAME}\$ \
    --all \
    --no-trunc \
    --format "{{.ID}}" | xargs --no-run-if-empty docker rm --force

# start mariadb in the background
docker run \
    --name "${CONTAINER_NAME}" \
    --volume /var/local/container_data/mariadb:/var/lib/mysql \
    --health-cmd "mysqladmin --protocol=tcp --silent ping" \
    --health-interval 1s \
    --health-retries 20 \
    --health-timeout 1s \
    --detach \
    ${IMAGE_NAME}
```
