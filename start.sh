#!/usr/bin/env bash
set -eux

docker run -d --name youtube-dl \
  --net=host \
  -e APP_PORT=8360 \
  -e MY_ID=guest \
  -e MY_PW=guest \
  -v "/mnt/d3p1/youtube-dl:/downfolder" \
  -e 'PROXY=http://127.0.0.1:8118' \
  youtube-dl-nas:local
