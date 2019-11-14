#!/usr/bin/env bash
set -e

SPARK_VERSION=2.4.4

[[ -d cache ]] || mkdir cache
cd cache

ARCHIVE_URL="https://www.apache.org/dyn/mirrors/mirrors.cgi?action=download&filename=spark/spark-$SPARK_VERSION/spark-$SPARK_VERSION-bin-hadoop2.7.tgz"
ARCHIVE_NAME="$(basename "$ARCHIVE_URL")"

if [[ ! -f "$ARCHIVE_NAME" ]]; then
    echo "  > Downloading $ARCHIVE_NAME..."
    wget "$ARCHIVE_URL" -O "$ARCHIVE_NAME"
fi

if [[ ! -d "$ARCHIVE_NAME" ]]; then
    echo "  > Extracting $ARCHIVE_NAME..."
    tar -xf "$ARCHIVE_NAME"
fi

DIRNAME="$(find . -type d -iname 'spark-*' -print -quit)"

cd $DIRNAME
./bin/docker-image-tool.sh -t "v$SPARK_VERSION" build
