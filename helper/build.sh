#! /bin/bash -eu

PROJ_PATH=$(readlink -f $(cd $(dirname $(readlink -f $0)) && pwd))
cd ${PROJ_PATH}/..

mkdir -p artifacts

docker-compose build
docker run --rm -v "${PWD}/artifacts:/artifacts" --entrypoint="cp" prometheus_null_adapter "/prometheus_null_adapter" "/artifacts"
