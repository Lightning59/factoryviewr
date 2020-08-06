#!/bin/bash

# Get repo absolute location for mounting into the container.
local_workdir=$(cd $(dirname $(dirname "${BASH_SOURCE[0]}")) >/dev/null 2>&1 && pwd)

main() {
  # Working directory inside the container.
  local container_workdir=/go/src/github.com/Lightning59/factoryview
  # Identifying container name.
  local container_name=factoryviewdev  

  docker run --rm -it \
    --name $container_name \
    --volume $local_workdir:$container_workdir \
    --workdir $container_workdir \
    -p 9000:9000 -p 8000:8000 \
    factoryviewdev
}

main