#!/usr/bin/env bash

docker_clean_untagged () {
  docker rmi "$(docker images | grep "^<none>" | awk "{print $3}")"
}

docker_prune_all () {
  docker container prune -f
  docker image prune -f
  docker network prune -f
  docker volume prune -f
}
