DOCKER_TAG=$1
GH_TAG=$2

docker build . --platform arm64 -t $DOCKER_TAG-arm64 -t $GH_TAG-arm64 & \
docker build . --platform amd64 -t $DOCKER_TAG-amd64 -t $GH_TAG-amd64

docker manifest create $DOCKER_TAG --amend $DOCKER_TAG-arm64 --amend $DOCKER_TAG-amd64
docker manifest create $GH_TAG --amend $GH_TAG-arm64 --amend $GH_TAG-amd64

docker push $DOCKER_TAG-arm64
docker push $DOCKER_TAG-amd64
docker push $GH_TAG-arm64
docker push $GH_TAG-amd64

docker manifest push $DOCKER_TAG
docker manifest push $GH_TAG
