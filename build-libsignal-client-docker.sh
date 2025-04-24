#!/usr/bin/env bash
set -euo pipefail

DOCKER_VOLUME="-v /run/user/1000/podman/podman.sock:/run/user/1000/podman/podman.sock"

rm -rf build
mkdir build

docker compose run --build --rm $DOCKER_VOLUME -v $(pwd)/build:/build -w /build libsignal ${1:-build-libsignal-client.sh}
